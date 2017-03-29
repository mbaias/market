class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
    	t.integer :buyer_id
    	t.boolean :completed, default: false
      t.timestamps
    end
  end
end
