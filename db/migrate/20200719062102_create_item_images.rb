class CreateItemImages < ActiveRecord::Migration[6.0]
  def change
    create_table :item_images do |t|
      t.references :items, null: false, foreign_key: true
      t.string :image_url, null: false

      t.timestamps
    end
  end
end
