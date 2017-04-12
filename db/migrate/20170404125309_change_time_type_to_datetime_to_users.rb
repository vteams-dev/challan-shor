class ChangeTimeTypeToDatetimeToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :expires_at, :datetime
  end
end
