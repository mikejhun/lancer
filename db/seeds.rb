# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.where(name: 'Web Development').first_or_create(name: "Web Development")
Category.where(name: 'Design').first_or_create(name: "Design")
Category.where(name: 'Finance').first_or_create(name: "Finance")

location = [
	"Denver, CO",
	"San Francisco, CA",
	"Minneapolis, MN",
	"New York, NY",
	"Atlanta, GA"
]

User.where(email: "dan@dan.com").first_or_create(email: "dan", password: "pwwwwwwwwwwwww")

10.times do
	User.create(email: Faker::Internet.email, password: "pwwwwwwwwwwwww")
end

100.times do 
	Gig.create(name: Faker::Name.title,
				description: Faker::Lorem.paragraph(2),
				budget: rand(200..10000),
				location: location.sample,
				user_id: rand(1..2),
				category_id: rand(1..3))
end

