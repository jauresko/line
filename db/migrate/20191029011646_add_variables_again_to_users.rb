class AddVariablesAgainToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sum_rating, :integer
    add_column :users, :average_rating, :integer
    add_column :users, :deliveries, :integer
    add_reference :reviews, :user, foreign_key: true
  end
end
