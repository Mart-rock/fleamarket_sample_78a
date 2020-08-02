class RenameShippingAreaColumnToShippingAreaId < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :shipping_area, :shipping_area_id
  end
end
