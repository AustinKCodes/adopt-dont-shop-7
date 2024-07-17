# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


shelter = Shelter.create!(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
pet1 = shelter.pets.create!(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true)
pet2 = shelter.pets.create!(name: "Minny", age: 2, breed: "Hound", adoptable: true)
pet3 = shelter.pets.create!(name: "Scabby", age: 2, breed: "Great Dane", adoptable: true)

application1 = Application.create!(name: "Debra Leen", address: "123 4th St. Fallbrook, CA 92028", description: "I am a good person, unkay!", status: "In Progress")
application2 = Application.create!(name: "Tilly Bum", address: "123 4th St. Fallbrook, CA 92028", description: "I am a good person, unkay!", status: "In Progress")