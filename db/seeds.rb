# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all
User.destroy_all
Comment.destroy_all
Video.destroy_all

user = User.new 
user.name = 'admin'
user.admin = true
user.email = 'admin@omniscience.com'
user.password = '123123'
user.password_confirmation = '123123'
user.skip_confirmation!
user.save!

puts "%" * 50
puts "       Base de données Catgory remplie !"
puts "%" * 50
