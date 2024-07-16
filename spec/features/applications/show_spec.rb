require "rails_helper"

RSpec.describe "application show page" do
  it "shows an application's attribute information" do
    shelter = Shelter.create!(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
    pet1 = shelter.pets.create!(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true)
    pet2 = shelter.pets.create!(name: "Minny", age: 2, breed: "Hound", adoptable: true)

    application = Application.create!(name: "Debra", address: "123", description: ";lkhj", status: "Pending")

    ApplicationPet.create!(application: application, pet: pet1)
    ApplicationPet.create!(application: application, pet: pet2)

    visit "/applications/#{application.id}"
    
    expect(page).to have_content(application.name)
    expect(page).to have_content(application.address)
    expect(page).to have_content(application.description)
    expect(page).to have_link(pet1.name)
    expect(page).to have_link(pet2.name)
    expect(page).to have_content(application.status)
    
    click_on(pet2.name)

    expect(page).to have_current_path("/pets/#{pet2.id}")
    expect(page).to have_content(pet2.name)
    expect(page).to have_content(pet2.age)
    expect(page).to have_content(pet2.breed)
    expect(page).to have_content(pet2.adoptable)

    end
end