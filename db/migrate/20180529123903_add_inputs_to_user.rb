class AddInputsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :street, :string
    add_column :users, :zip_code, :string
    add_column :users, :city, :string
    add_column :users, :phone_number, :string
    add_column :users, :nationality, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :marital_status, :string
  end
end
