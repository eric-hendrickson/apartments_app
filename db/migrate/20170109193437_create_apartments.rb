class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.float :latitude
      t.float :longitude
      t.string :address1
      t.string :address2
      t.string :city
      t.integer :zip
      t.string :state
      t.string :country
      t.string :name
      t.integer :phone_number
      t.text :hours

      t.timestamps null: false
    end
  end
end
