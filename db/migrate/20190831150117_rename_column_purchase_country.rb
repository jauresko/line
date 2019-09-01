class RenameColumnPurchaseCountry < ActiveRecord::Migration[5.2]
  def change
    rename_column :purchases, :purchase_country, :purchase_place
  end
end
