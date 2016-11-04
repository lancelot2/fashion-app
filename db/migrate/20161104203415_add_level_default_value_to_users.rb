class AddLevelDefaultValueToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :access_level, :integer, null: false, default: 1
    remove_column :users, :level, :string
  end
end
