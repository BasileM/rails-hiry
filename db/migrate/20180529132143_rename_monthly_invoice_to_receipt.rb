class RenameMonthlyInvoiceToReceipt < ActiveRecord::Migration[5.2]
  def change
    rename_column :receipts, :montlhy_invoice, :monthly_invoice
  end
end
