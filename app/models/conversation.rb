class Conversation < ApplicationRecord
	belongs_to :seller
	belongs_to :buyer
	has_many :messages
end
