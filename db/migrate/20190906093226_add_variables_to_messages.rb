class AddVariablesToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :time, :datetime
  end
end
