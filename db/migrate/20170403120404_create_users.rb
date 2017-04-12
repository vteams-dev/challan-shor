class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :phone_number
      t.string :pin
      t.boolean :verified

      t.timestamps
    end
  end
end
