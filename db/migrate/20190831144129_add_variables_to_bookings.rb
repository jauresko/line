class AddVariablesToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :purchase, foreign_key: true
  end
end
