class ChangeDataCnoditionIdToItems < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :condition_id, :string
  end
end
