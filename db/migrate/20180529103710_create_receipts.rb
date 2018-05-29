class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.integer :monthly_rent
      t.date :date
      t.references :rental, foreign_key: true

      t.timestamps
    end
  end
end
