require "rails_helper"

RSpec.describe "create application" do
  it "has a link to Start an Application, then shows a new application form and creates it, and return to applications show page" do
    shelter = Shelter.create(name: "Aurora shelter", city: "Aurora, CO", foster_program: false, rank: 9)
    pet = shelter.pets.create!(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true)
  
    visit "/pets"
    click_on "Start an Application"
    expect(page).to have_current_path("/applications/new")

    fill_in "Name", with: "Debra"
    fill_in "Street address", with: "123 Nill St."
    fill_in "Description", with: "I am a good person"
    fill_in "City", with: "Fallbrook"
    fill_in "State", with: "TN"
    fill_in "Zip", with: "85236"
    
    click_on "Submit"
    application = Application.last
  
    expect(current_path).to eq("/applications/#{application.id}")
    expect(page).to have_content("Debra")
    expect(page).to have_content("123")
    expect(page).to have_content("I am a good person")
    expect(page).to have_content("In Progress")
    end

  it "cannot create an application without every field filled in" do 
    shelter = Shelter.create(name: "Aurora shelter", city: "Aurora, CO", foster_program: false, rank: 9)
    pet = shelter.pets.create!(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true)
  
    visit "/pets"
    click_on "Start an Application"
    expect(page).to have_current_path("/applications/new")

    click_on "Submit"

    expect(page).to have_content("Make sure all fields are filled in!")
    expect(page).to have_button("Submit")
  end

  
  
end