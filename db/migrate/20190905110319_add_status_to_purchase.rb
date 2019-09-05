class AddStatusToPurchase < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :status, :string, :default => 'Pending'
  end
end
