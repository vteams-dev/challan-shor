class CreateUserLocations < ActiveRecord::Migration[5.0]
  def change
    drop_table :user_locations
    create_table :user_locations do |t|
      t.float :latitude
      t.float :longitude
      t.integer :user_id

      t.timestamps
    end
  end
end
