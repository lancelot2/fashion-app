# frozen_string_literal: true
class AddStuffToSearches < ActiveRecord::Migration[5.0]
  def change
    add_column :searches, :url, :string
    add_reference :searches, :user, foreign_key: true
  end
end
