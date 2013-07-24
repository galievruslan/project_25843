class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :age
      t.string :gender
      t.integer :country_id
      t.integer :region_id
      t.integer :city_id
      t.string :q_gender
      t.integer :q_age_from
      t.integer :q_age_to
      t.integer :q_country_id
      t.integer :q_region_id
      t.integer :q_city_id

      t.timestamps
    end
  end
end
