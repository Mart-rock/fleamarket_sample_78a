class Item < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :category, optional: true
  has_many :item_images, dependent: :destroy
  has_many :item_purchase 

  accepts_nested_attributes_for :item_images, allow_destroy: true

  validates :price, presence: true, numericality: { greater_than_or_equal_to:50 ,less_than_or_equal_to:10000000 }
  validates :name, :text, :item_images, presence: true
  validates :category_id, presence: true, inclusion: { in: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47] }
  validates :condition_id, :shipping_charges_id, :shipping_area_id, :days_until_delivery_id, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :days_until_delivery
end