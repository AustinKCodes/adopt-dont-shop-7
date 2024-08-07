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

  it "can add a Pet to the application" do
    shelter = Shelter.create!(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
    pet1 = shelter.pets.create!(name: "Scooby", age: 2, breed: "Great Doon", adoptable: true)
    pet2 = shelter.pets.create!(name: "Scabby", age: 2, breed: "Great Dane", adoptable: true)
    pet3 = shelter.pets.create!(name: "Scibby", age: 2, breed: "Great Dizzle", adoptable: true)
    application = Application.create!(name: "Debra", address: "123", description: ";lkhj", status: "In Progress")

    visit "/applications/#{application.id}"

    within '.pet-search' do
      expect(page).to have_content("Add a Pet to this Application")
      expect(page).to have_button('Search')

      fill_in "Search", with: "Scibby"
      click_on("Search")
    end
  
    within '.pet-results' do
      expect(page).to have_content("Search Results")
      expect(page).to have_content("Scibby")
    end
  end

  it "has a submission option" do
    shelter = Shelter.create!(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
    pet1 = shelter.pets.create!(name: "Scooby", age: 2, breed: "Great Doon", adoptable: true)
    pet2 = shelter.pets.create!(name: "Scabby", age: 2, breed: "Great Dane", adoptable: true)
    pet3 = shelter.pets.create!(name: "Scibby", age: 2, breed: "Great Dizzle", adoptable: true)
    application = Application.create!(name: "Debra", address: "123", description: ";lkhj", status: "In Progress")
    ApplicationPet.create!(application: application, pet: pet1)
    ApplicationPet.create!(application: application, pet: pet2)
    
    visit "/applications/#{application.id}"

    within '.submit-app' do
      expect(page).to have_content("Submit Your Application")
      expect(page).to have_button("Submit")
    end

    within '.app-details' do
      expect(page).to have_content(pet1.name)
      expect(page).to have_content(pet2.name)
    end
  
    within '.submit-app' do
      click_on 'Submit'
      expect(page).to have_no_button('Submit')
      expect(page).not_to have_content('Submit Your Application')
    end

    within '.pet-results' do
      expect(page).not_to have_button('Adopt this Pet')
    end

    within '.pet-search' do
      expect(page).not_to have_button('Submit')
    end

    within '.app-details' do
      expect(page).to have_content("Pending")
    end
end
end