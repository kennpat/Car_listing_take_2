require 'rails_helper'

feature 'user adds a new manufacturer to the database', %{
  As a user I want to add a new manufacturer
  so that I can add vehicles from that manufacturer
  to track my inventory available for sale.
} do

  scenario 'user posts manufacturer with correct info' do
    visit new_manufacturer_path
    fill_in 'Manufacturer Name', with: 'BMW'
    fill_in 'Country of Manufacture', with: 'Germany'
    click_on 'Submit'

    expect(page).to have_content('Manufacturer posted successfully')
    expect(page).to have_content('BMW')
    expect(page).to have_content('Germany')
  end

  scenario 'user posts manufacturer with incorrect info' do
    visit new_manufacturer_path
    click_on 'Submit'

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Country can't be blank")

  end

  scenario 'user tries to post a duplicate manufacturer' do
    manufacturer = FactoryGirl.create(:manufacturer)
    visit new_manufacturer_path
    fill_in 'Manufacturer Name', with: manufacturer.name
    fill_in 'Country of Manufacture', with: manufacturer.country
    click_on 'Submit'

    expect(page).to have_content('Name has already been taken
      Manufacturer Name Country of Manufacture')
  end

end
