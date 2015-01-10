require 'rails_helper'

feature 'User adds a new vehicle to the inventory', %{
  As a user I would like to be able to add vehicles to the inventory
  so that I can track my available vehicles
} do
  scenario 'user adds a new vehicle to the inventory' do
    manufacturer1 = FactoryGirl.create(:manufacturer)
    visit new_vehicle_path

    vehicle = FactoryGirl.build(:vehicle)

    fill_in 'Year', with: vehicle.year
    fill_in 'Color', with: vehicle.color
    fill_in 'Mileage', with: vehicle.mileage

    select manufacturer1.name, from: "Manufacturer"

    click_on 'Submit'

    expect(page).to have_content('Vehicle added successfully')
    expect(page).to have_content vehicle.year
    expect(page).to have_content vehicle.color
    expect(page).to have_content vehicle.mileage
    expect(page).to have_content manufacturer1.name

  end

  scenario 'user clicks submit with not data entered' do
    manufacturer1 = FactoryGirl.create(:manufacturer)
    visit new_vehicle_path

    vehicle = FactoryGirl.build(:vehicle)
    click_on 'Submit'

    expect(page).to have_content("Color can't be blank")
    expect(page).to have_content("Year can't be blank")
    expect(page).to have_content("Mileage can't be blank")
    expect(page).to have_content("Manufacturer can't be blank")
  end

  scenario 'user tries to enter a really really old car - pre 1920' do
    manufacturer1 = FactoryGirl.create(:manufacturer)
    visit new_vehicle_path

    vehicle = FactoryGirl.build(:vehicle)

    fill_in 'Year', with: 1919
    fill_in 'Color', with: vehicle.color
    fill_in 'Mileage', with: vehicle.mileage

    select manufacturer1.name, from: "Manufacturer"

    click_on 'Submit'

    expect(page).to have_content('Year must be greater than 1920')

  end
end
