require 'rails_helper'

RSpec.describe "apartments/new", type: :view do
  before(:each) do
    assign(:apartment, Apartment.new(
      :latitude => 1.5,
      :longitude => 1.5,
      :address1 => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :zip => 1,
      :state => "MyString",
      :country => "MyString",
      :name => "MyString",
      :phone_number => 1,
      :hours => "MyText"
    ))
  end

  it "renders new apartment form" do
    render

    assert_select "form[action=?][method=?]", apartments_path, "post" do

      assert_select "input#apartment_latitude[name=?]", "apartment[latitude]"

      assert_select "input#apartment_longitude[name=?]", "apartment[longitude]"

      assert_select "input#apartment_address1[name=?]", "apartment[address1]"

      assert_select "input#apartment_address2[name=?]", "apartment[address2]"

      assert_select "input#apartment_city[name=?]", "apartment[city]"

      assert_select "input#apartment_zip[name=?]", "apartment[zip]"

      assert_select "input#apartment_state[name=?]", "apartment[state]"

      assert_select "input#apartment_country[name=?]", "apartment[country]"

      assert_select "input#apartment_name[name=?]", "apartment[name]"

      assert_select "input#apartment_phone_number[name=?]", "apartment[phone_number]"

      assert_select "textarea#apartment_hours[name=?]", "apartment[hours]"
    end
  end
end
