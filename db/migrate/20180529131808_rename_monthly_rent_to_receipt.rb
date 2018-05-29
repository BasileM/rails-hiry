class RenameMonthlyRentToReceipt < ActiveRecord::Migration[5.2]
  def change
    rename_column :receipts, :monthly_rent, :montlhy_invoice
  end
end
