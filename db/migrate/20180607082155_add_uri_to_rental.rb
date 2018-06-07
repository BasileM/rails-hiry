class AddUriToRental < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :uri, :string
  end
end
