# encoding: utf-8

puts "Setting up users"
User.delete_all
user = User.create! name: "Fox", email: "foxmulder@xfiles.com", password: "123123",
                    password_confirmation: "123123", terms: "1"
user.update_attribute :confirmed_at, Time.zone.now

puts "Setting up sports"
Sport.delete_all
["Alpinismo", "Badmintón", "Baloncesto", "Bodyboard", "Buceo", "Camping",
 "Bicicletas de montaña", "Bicicletas de ocio", "Bicicletas de carretera",
 "Deportes de contacto", "Escalada", "Esquí", "Equitación", "Fitness",
 "Fútbol", "Fútbol americano", "Fútbol sala", "Golf", "Hockey", "Kayak",
 "Kitesurf", "Náutica", "Pádel", "Patines", "Monopatinetes", "Pesca y caza",
 "PingPong", "Rafting", "Rugby", "Running", "Skateboard", "Snowboard",
 "Squash", "SUP", "Surf", "Tenis", "Tiro con arco", "Trekking", "Voleybol",
 "Wakeboard", "Windsurf", "Otros"].each do |sport|
  Sport.create(name: sport)
end

puts "Setting up states"
State.delete_all
File.foreach(Rails.root.join("db/seed/states")) do |line|
  state = line.split(",")
  State.create! name: state[0], latitude: state[1].to_f, longitude: state[2].to_f
end

puts "Setting up sections"
Section.delete_all
%w(Material Entrenadores Fisioterapeutas Nutricionistas Escuelas
   Alojamiento Libros Gimnasios).each do |section|
  Section.create(name: section)
end

if Rails.env.development?
  20.times do
    advert = FactoryGirl.create :advert,
                                user: user,
                                state: State.order("RAND()").first,
                                sport: Sport.order("RAND()").first,
                                section: Section.order("RAND()").first

    rand = rand(10)
    next if rand == 0

    lg_url = "http://lorempixel.com/700/450/sports/#{rand}/"
    md_url = "http://lorempixel.com/360/200/sports/#{rand}/"
    sm_url = "http://lorempixel.com/48/48/sports/#{rand}/"
    2.times do
      FactoryGirl.create :attachment,
                         advert: advert,
                         lg_url: lg_url,
                         md_url: md_url,
                         sm_url: sm_url
    end
  end

  10.times do
    FactoryGirl.create :article
  end
end

puts "Done!"
