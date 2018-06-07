class AddTokenToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :renter_token, :string
  end
end
