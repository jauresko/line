class AddVariablesToTravels < ActiveRecord::Migration[5.2]
  def change
    add_column :travels, :price, :integer
    add_column :travels, :pick_up_place, :string
  end
end
