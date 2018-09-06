class Item < ApplicationRecord
	#Database Relation
	belongs_to :item_category
	has_one :item_tax, dependent: :destroy

	#Validation
	validates_associated :item_category
	validates :item_category_id, :presence => true
	validates :name, :presence => true
	validates :rate, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }
end
