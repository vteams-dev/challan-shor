class AddFNameLNameEmailToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :f_name, :string
    add_column :users, :l_name, :string
    add_column :users, :email, :string
  end
end
