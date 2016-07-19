# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  School.create!(name: Faker::University.name)
  5.times do
    Teacher.create!(name: Faker::Superhero.name)
    5.times do
      Student.create!(name: Faker::SlackEmoji.people)
    end
  end
end
