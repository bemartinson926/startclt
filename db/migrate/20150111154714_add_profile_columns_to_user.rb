class AddProfileColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :bio, :text
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :phone_number, :string  
  end
end
