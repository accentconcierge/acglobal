class AddFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :home_address, :string
  	add_column :users, :work_address, :string
  	add_column :users, :country_code, :string
  	add_column :users, :phone_number, :string
  	add_column :users, :terms, :boolean
  end
end
