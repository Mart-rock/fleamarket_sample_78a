class ChangeDataShippingChargesToItems < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :shipping_charges, :string
  end
end
