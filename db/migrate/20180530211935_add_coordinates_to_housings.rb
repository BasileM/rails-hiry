class AddCoordinatesToHousings < ActiveRecord::Migration[5.2]
  def change
    add_column :housings, :latitude, :float
    add_column :housings, :longitude, :float
  end
end
