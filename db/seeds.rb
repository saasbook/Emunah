# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'fake_seth@gmail.com', password: 'abcdef', full_name: 'Seth Martin', "role": 'admin')
User.create(email: 'wayne@gmail.com', password: 'abcdef', full_name: 'Wayne Li', "role": 'user')
User.create(email: 'joe@gmail.com', password: 'abcdef', full_name: 'Joe Law', "role": 'user')
User.create(email: 'Jackm@gmail.com', password: 'abcdef', full_name: 'Jack Mark', "role": 'user')
User.create(email: 'damon@gmail.com', password: 'abcdef', full_name: 'Damon Li', "role": 'user')
User.create(email: 'bob@gmail.com', password: 'abcdef', full_name: 'Bob Law', "role": 'user')
User.create(email: 'jan@gmail.com', password: 'abcdef', full_name: 'Jan Mark', "role": 'user')
User.create(email: 'dec@gmail.com', password: 'abcdef', full_name: 'Dec Li', "role": 'user')
User.create(email: 'mani@gmail.com', password: 'abcdef', full_name: 'Mani Law', "role": 'user')
User.create(email: 'Jann@gmail.com', password: 'abcdef', full_name: 'Jan Mark', "role": 'user')


family = Family.create(:family_name => "Wayne and Seth")

peopleOne = family.people.build({
	full_name: "Armando Fox",
	hebrew_name: "Armaindai Faix",
	birthday: Date.today,
	home_address: "1234 Telegraph Ave",
	telephone: '1112221234',
	telephone_type: 'home',
	email_address: "Armando@gmail.com",
	employer: "Store A",
	occupation: "Clerk",
	anniversary: "1/1/2017",
	is_child: false,
	discovery: "Discovery A, Discovery B",
	hobbies: "Running, Reading",
	skills: "Cooking, Drawing",
	activities: "Skiing, Skydiving",
	committees: "Art",
	allow_contact: "Yes"
	})

peopleOne.save!