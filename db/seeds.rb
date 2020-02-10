# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create(name: "admin")
Role.create(name: "default")

user = User.new(first_name: "Lakhan", last_name: "Meena", username: "lakhanmeena", mobile_number: "8982100807", email: "lakhanmeena170@gmail.com", password: "123456", password_confirmation: "123456")
user.save

user.add_role :admin