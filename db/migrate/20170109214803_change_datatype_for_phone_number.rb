class ChangeDatatypeForPhoneNumber < ActiveRecord::Migration
  def change
    change_column(:apartments, :phone_number, :string)
  end
end
