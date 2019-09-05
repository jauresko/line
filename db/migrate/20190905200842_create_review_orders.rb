class CreateReviewOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :review_orders do |t|
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end
