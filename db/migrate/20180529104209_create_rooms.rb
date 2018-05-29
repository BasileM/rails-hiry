class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :housing, foreign_key: true
      t.string :type_of_room
      t.float :size

      t.timestamps
    end
  end
end
