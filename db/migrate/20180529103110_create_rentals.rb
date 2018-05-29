class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.references :housing, foreign_key: true
      t.boolean :furnished, default: false
      t.date :start_date
      t.date :end_date
      t.integer :monthly_rent
      t.integer :monthly_expenses
      t.string :lease_pdf
      t.string :inventory_pdf

      t.timestamps
    end
  end
end
