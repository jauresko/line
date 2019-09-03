class AddBonusTravelerToPurchase < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :bonus_traveler, :integer
  end
end
