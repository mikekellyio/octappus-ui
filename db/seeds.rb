# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
["Hang Glider", "Skystormer", "Rank",
  "Rank 1", "John 3:16", "Rank 2", "Say what \"S\" and \"P\" stand for.",
  "1 John 4:14", "Psalm 147:5", "Rank 3", "Say what \"A\" and \"R\" stand for",
  "1 Corinthians 15:3", "1 Corinthians 15:4", "Rank 4", "Say what \"K\" stands for.",
  "James 2:10", "Rank 5", "Say what \"S\" stands for.", "Acts 16:31", "Rank 6",
  "Deuteronomy 31:8", "Rank 7", "Complete the word puzzle",
  "Say all 39 books of the Old Testament.", "Rank 8",
  "Say all 27 books of the New Testament.", "Red Jewel 1", "Red Jewel 1:1",
  "Bring a friend", "Red Jewel 1:2", "Luke 2:10-11", "Red Jewel 1:3",
  "John 1:1-3", "Red Jewel 1:4",
  "Tell your leader what the wise men did to love and honor the King", "Isaiah 9:6"].each do |title|
    Step.create title: title
  end

grades = ["K", 1, 2]
15.times do
  Team.create name: "#{grades.sample} #{Faker::Commerce.color.titleize}"
end

125.times do
  Child.create first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               birthday: Faker::Time.between(8.years.ago, 5.years.ago),
               team_id: Team.all.sample.id
end
