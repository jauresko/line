class AddADeparturePlaceToTravel < ActiveRecord::Migration[5.2]
  def change
    add_column :travels, :departure_place, :string
    add_column :travels, :weight_left, :integer
  end
end
