# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |n|
  User.create!(
    username: Faker::Book.author,
    email: Faker::Internet.unique.email,
    password: "password",
    password_confirmation: "password"
  )
end

100.times do |article|
  Article.create(
      user: User.offset(rand(User.count)).first,
      title: Faker::Book.title,
      description: Faker::Quote.matz
  )
end

User.create!(
  username: "mia",
  email: "mia@gmail.com",
  password: "11111",
  password_confirmation: "11111",
  admin: true
)
