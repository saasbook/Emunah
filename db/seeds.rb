# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'fake_seth@gmail.com', password: 'abcdef', full_name: 'Seth Martin', is_admin: 'Yes')
User.create(email: 'wayne@gmail.com', password: 'abcdef', full_name: 'Wayne Li', is_admin: 'No')
User.create(email: 'joe@gmail.com', password: 'abcdef', full_name: 'Joe Law', is_admin: 'No')
User.create(email: 'Jackm@gmail.com', password: 'abcdef', full_name: 'Jack Mark', is_admin: 'No')