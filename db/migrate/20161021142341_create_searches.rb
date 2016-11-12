# frozen_string_literal: true
class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :name
      t.string :url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
