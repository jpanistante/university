require "csv"
require "faker"

# Faker::Name.unique.clear
# Faker::Internet.email(name: Faker::Name).clear

Page.delete_all
Student.delete_all
Department.delete_all

filename = Rails.root.join("db/departments.csv")

puts "Loading in Departments from #{filename}."

csv_data = File.read(filename)

departments = CSV.parse(csv_data, headers: true, encoding: "utf-8")

departments.each do |row|
  # Populate the Department table
  d = Department.create(name: row["Department_Name"])
  rand_num = rand(5..10)

  rand_num.times do
    name = Faker::Name.name

    d.students.create([{
                        name:     name,
                        gender:   Faker::Gender.binary_type,
                        email:    Faker::Internet.email(name: name),
                        username: Faker::Internet.username(specifier: name)
                      }])
  end
end

Page.create(title:     "About",
            content:   "Students (generated through Faker)
            Every student must have a name, username and email. No validation for gender for real-life purposes. Username and email must be unique as no two students can have the same credentials. This model will reference Departments. When clicked individually, it will “show” the username and email of that specific student.

            Departments (generated through CSV file)
            A department has a name. There are 40 departments (fixed). This model will be referenced by Students. If a new department is added, it must have be unique and have a name. When clicked individually it will “show” the students under that department.
            ",
            permalink: "About")

puts "Created #{Department.count} Departments."
puts "Created #{Student.count} Students."
