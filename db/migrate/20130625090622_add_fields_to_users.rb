class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sex, :string
    add_column :users, :age, :integer
    add_column :users, :country_id, :integer
    add_column :users, :region_id, :integer
    add_column :users, :city_id, :integer
    add_column :users, :username, :string
  end
end
