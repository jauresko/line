class AddContactToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :recipient, :string
  end
end
