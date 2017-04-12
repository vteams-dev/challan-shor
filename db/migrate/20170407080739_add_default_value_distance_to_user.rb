class AddDefaultValueDistanceToUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :distance, :float, :default => 20.0
  end
end
