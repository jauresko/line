class RenameColumnCountry < ActiveRecord::Migration[5.2]
  def change
    rename_column :purchases, :country, :purchase_country
  end
end
