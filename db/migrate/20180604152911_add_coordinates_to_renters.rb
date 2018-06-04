class AddCoordinatesToRenters < ActiveRecord::Migration[5.2]
  def change
    add_column :renters, :latitude, :float
    add_column :renters, :longitude, :float
  end
end
