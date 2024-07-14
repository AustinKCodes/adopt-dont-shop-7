require "rails_helper"

RSpec.describe "application show page" do
  it "shows an application's attribute information" do
    shelter = Shelter.create!(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
    pet = shelter.pets.create!(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true)
    application = pet.applications.create!(name: "Debra Leen", address: "123 4th St, Nashville, TN, 56789", description: "Is this thing on?", pet_list: "#{pet.name}", status: "Pending")

    ApplicationPet.create!(application: application, pet: pet)

    
    visit "/applications/#{application.id}"
    save_and_open_page
    expect(page).to have_content(application.name)
    expect(page).to have_content(application.address)
    expect(page).to have_content(application.description)
    expect(page).to have_content(application.pet_list)
    expect(page).to have_content(application.status)
    
    click_on(pet.name)

    expect(page).to have_current_path("/pets/#{pet.id}")
    expect(page).to have_content(pet.name)
    expect(page).to have_content(pet.age)
    expect(page).to have_content(pet.breed)
    expect(page).to have_content(pet.adoptable)
save_and_open_page
    end
end