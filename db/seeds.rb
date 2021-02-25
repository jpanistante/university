require "csv"
require "faker"

# Faker::Name.unique.clear
# Faker::Internet.email(name: Faker::Name).clear

Student.delete_all
Department.delete_all

filename = Rails.root.join("db/departments.csv")

puts "Loading in Departments from #{filename}."

csv_data = File.read(filename)

departments = CSV.parse(csv_data, headers: true, encoding: "utf-8")

departments.each do |row|
  # Populate the Department table
  d = Department.create(name: row["Department_Name"])

  10.times do
    name = Faker::Name.name
    d.students.create([{
                        name:     name,
                        gender:   Faker::Gender.binary_type,
                        email:    Faker::Internet.email(name: name),
                        username: Faker::Internet.username(specifier: name)
                      }])
  end
end

puts "Created #{Department.count} Departments."
puts "Created #{Student.count} Students."
