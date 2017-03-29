class Product < ApplicationRecord
	belongs_to :order
	belongs_to :seller
	has_many :categories, through: :category_products
	has_many :category_products
end