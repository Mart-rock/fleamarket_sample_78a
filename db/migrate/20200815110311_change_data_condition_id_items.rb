class ChangeDataConditionIdItems < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :condition_id, :integer
  end
end
