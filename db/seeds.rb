# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

#Create Users

User.create!(
  email: 'member@cogniden.com',
  password: 'helloworld',
  confirmed_at: '2016-08-14'
)

admin = User.create!(
   email:    'admin@example.com',
   password: 'helloworld',
)
admin.add_role :admin

5.times do
  User.create!(
    email:    Faker::Internet.email,
    password: Faker::Internet.password(8),
    confirmed_at: '2016-08-14'
  )
end
users = User.all

#Create Wikis

20.times do
  Wiki.create!(
    title: Faker::Commerce.product_name,
    body: Faker::Company.catch_phrase,
    user: users.sample
  )
end
wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"