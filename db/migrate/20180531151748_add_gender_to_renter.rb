class AddGenderToRenter < ActiveRecord::Migration[5.2]
  def change
    add_column :renters, :gender, :string
  end
end
