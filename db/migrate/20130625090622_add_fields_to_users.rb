class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :birth_date, :date
    add_column :users, :city_id, :integer
    add_column :users, :region_id, :integer
    add_column :users, :country_id, :integer
    add_column :users, :username, :string
    add_index :users, :username, :unique => true
  end
end
