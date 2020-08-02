class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :category, null: false
      t.references :user, null: false
      t.string :name, null: false
      t.text :text, null: false
      t.integer :condition, null: false
      t.integer :price, null: false
      t.datetime :completed_at
      t.string :brand
      t.integer :shipping_charges, null: false
      t.integer :days_until_delivery, null: false
      t.integer :shipping_area, null: false
      t.timestamps
    end
  end
end
