class CreateProduct < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
    	t.string :title
    	t.string :description
    	t.integer :price
    	t.string :image
    	t.integer :seller_id

    	t.timestamps
    end
  end
end
