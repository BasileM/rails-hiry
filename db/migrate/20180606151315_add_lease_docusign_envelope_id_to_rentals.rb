class AddLeaseDocusignEnvelopeIdToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :lease_docusign_envelope_id, :string
  end
end
