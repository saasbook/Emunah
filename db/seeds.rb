# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


seth = User.create({email: "seth.martin@gmail.com", password: "abcdef", full_name: "Seth Martin", is_admin: "Yes"})
userA = User.create({email: "a@gmail.com", password: "abcdef", full_name: "User A", is_admin: "No"})
userB = User.create({email: "b@gmail.com", password: "abcdef", full_name: "User B", is_admin: "No"})
userB = User.create({email: "c@gmail.com", password: "abcdef", full_name: "User C", is_admin: "No"})
