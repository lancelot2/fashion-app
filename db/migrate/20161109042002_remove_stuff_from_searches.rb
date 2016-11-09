# frozen_string_literal: true
class RemoveStuffFromSearches < ActiveRecord::Migration[5.0]
  def change
    remove_column :searches, :name_filter, :string
    remove_column :searches, :brand_filter, :string
    remove_column :searches, :collection_filter, :string
    remove_column :searches, :gender_filter, :string
    remove_column :searches, :category_1_filter, :string
    remove_column :searches, :category_2_filter, :string
    remove_column :searches, :category_3_filter, :string
  end
end
