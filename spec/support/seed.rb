%w(Asturias Cantabria).each do |state|
  State.create!(name: state)
end

%w(Surf Bike).each do |sport|
  Sport.create!(name: sport)
end

%w(Material Clubs).each do |section|
  Section.create!(name: section)
end
