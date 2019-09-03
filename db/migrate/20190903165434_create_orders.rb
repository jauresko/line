class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date :date
      t.string :drop_place
      t.integer :total_price
      t.string :status, :default => 'Pending'
      t.references :user, foreign_key: true
      t.references :purchase, foreign_key: true

      t.timestamps
    end
  end
end
