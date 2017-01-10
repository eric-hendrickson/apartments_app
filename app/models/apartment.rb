class Apartment < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    address = ""
    address += self.address1.to_s + " " + self.address2.to_s + " " + self.city.to_s + " " + self.state.to_s + " " + self.zip.to_s + " " + self.country.to_s
    address = address.split.join(" ")
    address
  end

end
