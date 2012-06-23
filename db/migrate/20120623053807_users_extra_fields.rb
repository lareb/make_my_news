class UsersExtraFields < ActiveRecord::Migration
  def up
    add_column :users, :first_name, :string, :length => 45, :null => false
    add_column :users, :last_name, :string, :length => 45
    add_column :users, :phone, :string, :length => 15
    add_column :users, :address_line_1, :string, :length => 225, :null => false
    add_column :users, :address_line_2, :string, :length => 225
    add_column :users, :city, :string, :length => 45, :null => false
    add_column :users, :state, :string, :length => 45, :null => false
    add_column :users, :country, :string, :length => 100, :null => false
  end

  def down
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :phone
    remove_column :users, :address_line_1
    remove_column :users, :address_line_2
    remove_column :users, :city, :string
    remove_column :users, :state, :string
    remove_column :users, :country, :string
  end
end
