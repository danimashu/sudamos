['Asturias', 'Cantabria'].each do |state|
  State.create!(name: state)
end

['Surf', 'Bike'].each do |sport|
  Sport.create!(name: sport)
end

['Material', 'Clubs'].each do |section|
  Section.create!(name: section)
end
