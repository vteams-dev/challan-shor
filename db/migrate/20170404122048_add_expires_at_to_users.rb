class AddExpiresAtToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :expires_at, :datetime
  end
end
