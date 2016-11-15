# frozen_string_literal: true
class RemoveCompaniesIdToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :companies_id, :integer
  end
end
