class AddVariablesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :photo, :string
    add_column :users, :address, :string
    add_column :users, :nationality, :string
    add_column :users, :telephone, :string
    add_column :users, :whatsapp_number, :string
  end
end
