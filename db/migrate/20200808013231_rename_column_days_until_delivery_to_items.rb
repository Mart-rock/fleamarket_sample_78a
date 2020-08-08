class RenameColumnDaysUntilDeliveryToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :days_until_delivery, :days_until_delivery_id
  end
end
