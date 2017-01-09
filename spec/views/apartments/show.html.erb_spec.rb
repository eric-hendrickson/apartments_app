require 'rails_helper'

RSpec.describe "apartments/show", type: :view do
  before(:each) do
    @apartment = assign(:apartment, Apartment.create!(
      :latitude => 2.5,
      :longitude => 3.5,
      :address1 => "Address1",
      :address2 => "Address2",
      :city => "City",
      :zip => 4,
      :state => "State",
      :country => "Country",
      :name => "Name",
      :phone_number => 5,
      :hours => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/Address1/)
    expect(rendered).to match(/Address2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/MyText/)
  end
end
