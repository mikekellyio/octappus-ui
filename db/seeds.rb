# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Team.delete_all
Child.delete_all

grades = ["K", 1, 2]

10.times do
  Team.create name: "#{grades.sample} #{Faker::Commerce.color.titleize}"
end

125.times do
  Child.create first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               birthday: Faker::Date.between(8.years.ago, 5.years.ago),
               team: Team.all.sample
end
