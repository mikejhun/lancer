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
Category.where(name: 'Tech Support').first_or_create(name: "Tech Support")
Category.where(name: 'Engineering').first_or_create(name: "Engineering")
Category.where(name: 'Marketing').first_or_create(name: "Marketing")
Category.where(name: 'Administrative').first_or_create(name: "Administrative")

location = [
	"Denver, CO",
	"San Francisco, CA",
	"Minneapolis, MN",
	"New York, NY",
	"Atlanta, GA",
	"Miami, FL",
	"Austin, TX",
	"Boston, MA"
]

User.where(email: "dan@dan.com").first_or_create(email: "dan@dan.com", password: "pwwwwwwwwwwwww", name: 'Dan Smith')

10.times do
	User.create(email: Faker::Internet.email, password: "pwwwwwwwwwwwww", name: Faker::Name.name)
end

50.times do 
	sleep 0.25
	Gig.create(name: Faker::Name.title,
				description: Faker::Lorem.paragraph(2),
				budget: rand(200..10000),
				location: location.sample,
				user_id: rand(1..10),
				category_id: rand(1..7))
end

