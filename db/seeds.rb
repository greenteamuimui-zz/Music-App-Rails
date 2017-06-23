# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Band.destroy_all
Album.destroy_all

u1 = User.create!(email:"123@123.com", password:"123456")
u2 = User.create!(email:"456@456.com", password:"456789")

b1 = Band.create!(name:"Oranage")
b2 = Band.create!(name:"Yellow")

a1 = Album.create!(name:"Orange-A",band_id:b1.id, recording_style:"studio")
a2 = Album.create!(name:"Yellow-A",band_id:b2.id, recording_style:"live")
