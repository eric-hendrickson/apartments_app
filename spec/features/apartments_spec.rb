require 'rails_helper'

RSpec.feature "Apartments", type: :feature do

  context 'Going to the landing page' do
    Steps 'Seeing the content of listings' do
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

  context 'Creating a new listing' do
    Steps 'Going to the new listing page' do
      Given 'I am on the landing page' do
        visit '/'
      end
      And 'I click on "New Apartment"' do
        click_on('New Apartment')
      end
      Then 'I am taken to a page with title "New Apartment"' do
        expect(page).to have_content("New Apartment")
      end
    end

    Steps 'Creating a new listing' do
      Given 'I am a the "New Apartment" page' do
        visit '/apartments/new'
      end
      And 'I fill in the forms' do
        fill_in 'apartment[latitude]', with: '1.0'
        fill_in 'apartment[longitude]', with: '1.0'
        fill_in 'apartment[address1]', with: '3950 Mahaila Ave'
        fill_in 'apartment[address2]', with: 'Apt N25'
        fill_in 'apartment[city]', with: 'San Diego'
        fill_in 'apartment[state]', with: 'California'
        fill_in 'apartment[zip]', with: '92122'
        fill_in 'apartment[country]', with: 'USA'
        fill_in 'apartment[name]', with: 'Eric Hendrickson'
        fill_in 'apartment[phone_number]', with: '619-555-5555'
        fill_in 'apartment[hours]', with: '12-5 PM'
      end
      And 'I click "Create Apartment"' do
        click_button 'Create Apartment'
      end
      Then 'I can see a confirmation that the apartment was created' do
        expect(page).to have_content("Apartment was successfully created")
      end
    end
  end
end
