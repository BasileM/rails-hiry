class CreateHousings < ActiveRecord::Migration[5.2]
  def change
    create_table :housings do |t|
      t.string :street
      t.string :zip_code
      t.string :city
      t.string :type_of_housing
      t.string :legal_regime
      t.integer :year_of_construction
      t.integer :floor
      t.float :size
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
