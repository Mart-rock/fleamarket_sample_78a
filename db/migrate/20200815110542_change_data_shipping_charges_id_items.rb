class ChangeDataShippingChargesIdItems < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :shipping_charges_id, :integer
  end
end
