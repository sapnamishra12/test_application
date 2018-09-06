class ItemCategory < ApplicationRecord
	#Database Relation
	has_many :items, dependent: :destroy

	#Validation
	validates :name, :presence => true
end
