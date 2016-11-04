class AddAccessValidatedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :access_validated, :boolean, null: false, default: false
  end
end
