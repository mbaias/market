class Adduserid < ActiveRecord::Migration[5.0]
  def change
  	add_column :buyers, :user_id, :integer
  	add_column :sellers, :user_id, :integer
  end
end
