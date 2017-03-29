class Buyer < ApplicationRecord
	has_one :cart
	has_many :conversations
end
