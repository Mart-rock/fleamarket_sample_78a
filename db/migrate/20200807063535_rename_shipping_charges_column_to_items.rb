class RenameShippingChargesColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :shipping_charges, :shipping_charges_id
  end
end
