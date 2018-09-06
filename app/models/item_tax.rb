class ItemTax < ApplicationRecord
	#Database Relation
	belongs_to :item
    validates_presence_of :item

	#Variable Declaration
	enum :tax_type => {percentage: 1, value: 2}

	#Validation
	validates :tax_type, :presence => true
	validates :tax, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }
end
