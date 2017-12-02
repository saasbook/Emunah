# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# USERS
# ===============================================================================

u1 = User.create(email: 'fake_seth@gmail.com', password: 'abcdef', full_name: 'Seth Martin', "role": 'admin')
u2 = User.create(email: 'wayne@gmail.com', password: 'abcdef', full_name: 'Wayne Li', "role": 'user')
User.create(email: 'joe@gmail.com', password: 'abcdef', full_name: 'Joe Law', "role": 'user')
User.create(email: 'Jackm@gmail.com', password: 'abcdef', full_name: 'Jack Mark', "role": 'user')
User.create(email: 'damon@gmail.com', password: 'abcdef', full_name: 'Damon Li', "role": 'user')
User.create(email: 'bob@gmail.com', password: 'abcdef', full_name: 'Bob Law', "role": 'user')
User.create(email: 'jan@gmail.com', password: 'abcdef', full_name: 'Jan Mark', "role": 'user')
User.create(email: 'dec@gmail.com', password: 'abcdef', full_name: 'Dec Li', "role": 'user')
User.create(email: 'mani@gmail.com', password: 'abcdef', full_name: 'Mani Law', "role": 'user')
User.create(email: 'Jann@gmail.com', password: 'abcdef', full_name: 'Jan Mark', "role": 'user')

# FAMILIES
# ===============================================================================

f1 = Family.create({
	family_name: "Wayne and Seth",
	discovery: "Discovery A, Discovery B",
	hobbies: "Running, Reading",
	skills: "Cooking, Drawing",
	activities: "Skiing, Skydiving",
	committees: "Art",
	membership: "Member"
	})

f2 = Family.create({
	family_name: "Wang",
	discovery: "Discovery A, Discovery B",
	hobbies: "Running, Reading",
	skills: "Cooking, Drawing",
	activities: "Skiing, Skydiving",
	committees: "Art",
	membership: "Member"
	})

f3 = Family.create({
	family_name: "Tilamok",
	discovery: "Discovery A, Discovery B",
	hobbies: "Running, Reading",
	skills: "Cooking, Drawing",
	activities: "Skiing, Skydiving",
	committees: "Art",
	membership: "Member"
	})

# SUBMITTALS
# ===============================================================================

s1f1 = f1.submittals.build({
	title: "Submittal A",
	notes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis urna libero, vestibulum id dui eu, semper euismod felis. Donec ornare neque ut sem dignissim, quis molestie nulla fringilla.",
	family_name: "Wayne and Seth"
	})
s1f1.save!

s2f1 = f1.submittals.build({
	title: "Submittal B",
	notes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis urna libero, vestibulum id dui eu, semper euismod felis. Donec ornare neque ut sem dignissim, quis molestie nulla fringilla.",
	family_name: "Wayne and Seth"
	})
s2f1.save!

s3f1 = f1.submittals.build({
	title: "Submittal C",
	notes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis urna libero, vestibulum id dui eu, semper euismod felis. Donec ornare neque ut sem dignissim, quis molestie nulla fringilla.",
	family_name: "Wayne and Seth"
	})
s3f1.save!

s4f1 = f1.submittals.build({
	title: "Submittal D",
	notes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis urna libero, vestibulum id dui eu, semper euismod felis. Donec ornare neque ut sem dignissim, quis molestie nulla fringilla.",
	family_name: "Wayne and Seth"
	})
s4f1.save!

# TASKS
# ===============================================================================

t1 = Task.create({
	title: "Task 1",
	notes: "Two assure edward whence the was. Who worthy yet ten boy denote wonder. Weeks views her sight old tears sorry.",
	completed: true
	})

t2 = Task.create({
	title: "Task 2",
	notes: "Barton did feebly change man she afford square add. Want eyes by neat so just must.",
	completed: false
	})

u1.tasks << [t1, t2]

t3 = Task.create({
	title: "Task 1",
	notes: "Up is opinion message manners correct hearing husband my.",
	completed: false
	})

t4 = Task.create({
	title: "Task 2",
	notes: " Sir margaret drawings repeated recurred exercise laughing may you but.",
	completed: false
	})

u2.tasks << [t3, t4]

# PEOPLE
# ===============================================================================

f1p1 = f1.people.build({
	first_name: "Armando",
	last_name: "Fox",
	hebrew_name: "Hebrew Armando Fox",
	birthday: Date.today,
	home_address: "1234 Telegraph Ave",
	telephone: '1112221234',
	telephone_type: 'home',
	email_address: "Armando@gmail.com",
	employer: "Store A",
	occupation: "Clerk",
	anniversary: "1/1/2017",
	is_child: false,
	allow_contact: "Yes"
	})

f1p2 = f1.people.build({
	first_name: "Freeway",
	last_name: "Fox",
	hebrew_name: "Hebrew Armando Fox",
	birthday: Date.today,
	home_address: "1234 Telegraph Ave",
	telephone: '1112221234',
	telephone_type: 'home',
	email_address: "Armando@gmail.com",
	employer: "Store A",
	occupation: "Clerk",
	anniversary: "1/1/2017",
	is_child: false,
	allow_contact: "Yes"
	})

f1p1.save!
f1p2.save!

f2p1 = f2.people.build({
	first_name: "Wesley",
	last_name: "Wang",
	hebrew_name: "Hebrew Armando Fox",
	birthday: Date.today,
	home_address: "1234 Telegraph Ave",
	telephone: '1112221234',
	telephone_type: 'home',
	email_address: "Armando@gmail.com",
	employer: "Store A",
	occupation: "Clerk",
	anniversary: "1/1/2017",
	is_child: false,
	allow_contact: "Yes"
	})

f2p2 = f2.people.build({
	first_name: "Ruowen",
	last_name: "Li",
	hebrew_name: "Hebrew Armando Fox",
	birthday: Date.today,
	home_address: "1234 Telegraph Ave",
	telephone: '1112221234',
	telephone_type: 'home',
	email_address: "Armando@gmail.com",
	employer: "Store A",
	occupation: "Clerk",
	anniversary: "1/1/2017",
	is_child: false,
	allow_contact: "Yes"
	})

f2p1.save!
f2p2.save!

f3p1 = f3.people.build({
	first_name: "Casey",
	last_name: "Tilamok",
	hebrew_name: "Hebrew Armando Fox",
	birthday: Date.today,
	home_address: "1234 Telegraph Ave",
	telephone: '1112221234',
	telephone_type: 'home',
	email_address: "Armando@gmail.com",
	employer: "Store A",
	occupation: "Clerk",
	anniversary: "1/1/2017",
	is_child: false,
	allow_contact: "Yes"
	})

f3p2 = f3.people.build({
	first_name: "Peter",
	last_name: "Lee",
	hebrew_name: "Hebrew Armando Fox",
	birthday: Date.today,
	home_address: "1234 Telegraph Ave",
	telephone: '1112221234',
	telephone_type: 'home',
	email_address: "Armando@gmail.com",
	employer: "Store A",
	occupation: "Clerk",
	anniversary: "1/1/2017",
	is_child: false,
	allow_contact: "Yes"
	})

f3p1.save!
f3p2.save!

