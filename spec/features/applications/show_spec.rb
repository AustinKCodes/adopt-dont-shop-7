require "rails_helper"

RSpec.describe "application show page" do
  it "shows an applicants submitted information" do
    shelter = Shelter.create(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
    pet = Pet.create(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true, shelter_id: shelter.id)
    applicant = Application.create(name: "Debra Leen", address: "123 4th St, Nashville, TN, 56789", description: "Is this thing on?", pets: "test"
  end
end