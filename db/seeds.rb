# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
employee = User.create!(email: 'employee@test.com', role: 0, password: '123456')
manager = User.create!(email: 'manager@test.com', role: 1, password: '654321')

bill = Bill.create!(reference: 'Test bill', amount: 100.5)
