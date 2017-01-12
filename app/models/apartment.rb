class Apartment < ActiveRecord::Base
  belongs_to :user
  geocoded_by :full_address
  after_validation :geocode
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment :image,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    size: { in: 0..10.megabytes }

  def full_address
    address = ""
    address += self.address1.to_s + " " + self.address2.to_s + " " + self.city.to_s + " " + self.state.to_s + " " + self.zip.to_s + " " + self.country.to_s
    address = address.split.join(" ")
    address
  end

end
