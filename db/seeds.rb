# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faker::Config.locale = 'fr'
p "*" * 50
p " " * 50
p "                 STARTING SEEDING                 "
p " " * 50
p "*" * 50

p "Destroy curent data..."

p "Destroying users... #{User.count} "
User.destroy_all

p "-" * 50
p "-" * 50
############################################
users_number = 15
users_count = 0
############################################
############################################
####################### Create users
users_number.times do |i|
  users_count += 1
  User.create(
    email:Faker::Internet.free_email,
    password:"azerty1234",
    password_confirmation:"azerty1234"
  )
  system("clear")
  puts "#{users_count} users created"
  puts "|"+("█"*users_count)+(" "*(users_number-users_count))+"|"
end

puts ""
puts "Enjoy 🥃 !!!"
puts "----------->"