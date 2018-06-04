class AddFileToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :file, :string
  end
end
