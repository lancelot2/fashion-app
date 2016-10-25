class AddNamesToSearches < ActiveRecord::Migration[5.0]
  def change
    add_column :searches, :names, :string
  end
end
