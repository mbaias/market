class CreateSellers < ActiveRecord::Migration[5.0]
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :surname
      t.date :date_of_birth
      t.string :address
      t.string :phone
      t.string :email
      

      t.timestamps
    end
  end
end
