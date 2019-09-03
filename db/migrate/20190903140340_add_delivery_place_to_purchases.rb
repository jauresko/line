class AddDeliveryPlaceToPurchases < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :delivery_place, :string
  end
end
