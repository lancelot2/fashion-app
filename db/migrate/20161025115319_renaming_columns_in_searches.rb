# frozen_string_literal: true
class RenamingColumnsInSearches < ActiveRecord::Migration[5.0]
  def change
    rename_column :searches, :names, :name
    rename_column :searches, :brand, :brand_filter
  end
end
