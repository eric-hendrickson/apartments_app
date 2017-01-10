require 'rails_helper'

RSpec.describe Apartment, type: :model do
  it "has to exist" do
    expect{Apartment.new}.to_not raise_error
  end
  it "must have a two values for latitude and longitude (nil on initialization)" do
    apartment = Apartment.new
    expect(apartment.latitude).to eq(nil)
    expect(apartment.longitude).to eq(nil)
  end
  it "must have address1 and address2 be Floats" do
    apartment = Apartment.new
    apartment.latitude = 1
    apartment.longitude = 2
    expect(apartment.latitude).to be_a(Float)
    expect(apartment.longitude).to be_a(Float)
    expect(apartment.latitude).to eq(1.0)
    expect(apartment.longitude).to eq(2.0)
  end
  it "must have a two values for street designations (nil on initialization)" do
    apartment = Apartment.new
    expect(apartment.address1).to eq(nil)
    expect(apartment.address2).to eq(nil)
  end
  it "must have address1 and address2 be Strings" do
    apartment = Apartment.new
    apartment.address1 = 1
    apartment.address2 = 2
    expect(apartment.address1).to be_a(String)
    expect(apartment.address2).to be_a(String)
    expect(apartment.address1).to eq("1")
    expect(apartment.address2).to eq("2")
  end
  it "must have a value for city (nil on initialization)" do
    apartment = Apartment.new
    expect(apartment.city).to eq(nil)
  end
  it "must have city be a String" do
    apartment = Apartment.new
    apartment.city = 1
    expect(apartment.city).to be_a(String)
    expect(apartment.city).to eq("1")
  end
  it "must have a value for postal code (called zip; nil on initialization)" do
    apartment = Apartment.new
    expect(apartment.zip).to eq(nil)
  end
  it "must have postal code (zip) be an integer" do
    apartment = Apartment.new
    apartment.zip = 1
    expect(apartment.zip).to be_a(Integer)
    expect(apartment.zip).to eq(1)
  end
  it "must have a value for state (nil on initialization)" do
    apartment = Apartment.new
    expect(apartment.state).to eq(nil)
  end
  it "must have state be a String" do
    apartment = Apartment.new
    apartment.state = 1
    expect(apartment.state).to be_a(String)
    expect(apartment.state).to eq("1")
  end
  it "must have a value for country (nil on initialization)" do
    apartment = Apartment.new
    expect(apartment.country).to eq(nil)
  end
  it "must have country be a String" do
    apartment = Apartment.new
    apartment.country = 1
    expect(apartment.country).to be_a(String)
    expect(apartment.country).to eq("1")
  end
  it "must have a value for name for the address (nil on initialization)" do
    apartment = Apartment.new
    expect(apartment.name).to eq(nil)
  end
  it "must have name be a String" do
    apartment = Apartment.new
    apartment.name = 1
    expect(apartment.name).to be_a(String)
    expect(apartment.name).to eq("1")
  end
  it "must have a value for the phone number of the address (nil on initialization)" do
    apartment = Apartment.new
    expect(apartment.phone_number).to eq(nil)
  end
  it "must have phone_number be a String" do
    apartment = Apartment.new
    apartment.phone_number = 1
    expect(apartment.phone_number).to be_a(String)
    expect(apartment.phone_number).to eq("1")
  end
  it "must have a value for hours to show the apartment (nil on initialization)" do
    apartment = Apartment.new
    expect(apartment.country).to eq(nil)
  end
  it "must have hours be text (a String)" do
    apartment = Apartment.new
    apartment.country = 1
    expect(apartment.country).to be_a(String)
    expect(apartment.country).to eq("1")
  end
  it "must be able to successfully concatenate address elements into one string" do
    apartment = Apartment.new
    expect(apartment.full_address).to eq("")
    apartment.city = "San Diego"
    expect(apartment.full_address).to eq("San Diego")
    apartment.address1 = "3950 Mahaila Ave"
    expect(apartment.full_address).to eq("3950 Mahaila Ave San Diego")
    apartment.address2 = "Apt N25"
    apartment.state = "California"
    apartment.zip = "92122"
    apartment.country = "USA"
    expect(apartment.full_address).to eq("3950 Mahaila Ave Apt N25 San Diego California 92122 USA")
  end
end
