# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"
require "faker"

Faker::Name.unique.clear
Faker::Internet.email(name: Faker::Name).clear

Student.delete_all

Student.delete_all
Department.delete_all

filename = Rails.root.join("db/departments.csv")

puts "Loading in Departments from #{filename}."

csv_data = File.read(filename)

departments = CSV.parse(csv_data, headers: true, encoding: "utf-8")

# departments.each do |m|
#   puts m["Department_Name"]
# end
