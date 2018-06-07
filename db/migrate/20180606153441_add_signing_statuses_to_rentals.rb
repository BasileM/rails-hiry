class AddSigningStatusesToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :signed_by_owner, :boolean, default: false
    add_column :rentals, :signed_by_renter, :boolean, default: false
  end
end
