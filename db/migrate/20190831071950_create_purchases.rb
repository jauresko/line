class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.string :product_url
      t.string :name
      t.string :photo
      t.string :country
      t.string :seller
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
