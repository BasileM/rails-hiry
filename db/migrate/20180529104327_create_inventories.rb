class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.references :rental, foreign_key: true
      t.references :room, foreign_key: true
      t.string :state
      t.string :observations

      t.timestamps
    end
  end
end
