class AddDetailsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :role, :integer
    add_column :users, :status, :integer
    add_column :users, :ismanager, :boolean
  end
end