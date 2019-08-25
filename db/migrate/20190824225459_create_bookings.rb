class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :meeting_place
      t.date :date
      t.string :drop_place
      t.string :total_price
      t.references :user, foreign_key: true
      t.references :travel, foreign_key: true

      t.timestamps
    end
  end
end
