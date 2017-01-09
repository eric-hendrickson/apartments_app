require 'rails_helper'

RSpec.feature "Apartments", type: :feature do

  context 'Going to the landing page' do
    Steps 'Seeing the contennt of listings' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can see a header saying "Apartment Listings"' do
        expect(page).to have_content("Apartment Listings")
      end
      And 'I can also see a table, with headers saying: Latitude, Longitude, Address 1, Address 2, City, State, Zip, Country, Name, Phone Number, Hours' do
        expect(page).to have_content("Latitude")
        expect(page).to have_content("Longitude")
        expect(page).to have_content("Address 1")
        expect(page).to have_content("Address 2")
        expect(page).to have_content("City")
        expect(page).to have_content("State")
        expect(page).to have_content("Zip")
        expect(page).to have_content("Country")
        expect(page).to have_content("Name")
        expect(page).to have_content("Phone Number")
        expect(page).to have_content("Hours")
      end
    end
  end
end
