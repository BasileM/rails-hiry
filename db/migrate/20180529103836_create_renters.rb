class CreateRenters < ActiveRecord::Migration[5.2]
  def change
    create_table :renters do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :nationality
      t.date :date_of_birth
      t.string :marital_status
      t.references :rental, foreign_key: true

      t.timestamps
    end
  end
end
