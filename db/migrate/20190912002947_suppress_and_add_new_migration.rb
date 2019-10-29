class SuppressAndAddNewMigration < ActiveRecord::Migration[5.2]
  def change
    remove_column :travels, :pick_up_place
    remove_column :bookings, :meeting_place
    remove_column :bookings, :drop_place
  end
end
