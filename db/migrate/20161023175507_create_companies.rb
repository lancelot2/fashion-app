# frozen_string_literal: true
class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :retailer
      t.string :supplier
      t.string :logo
      t.text :description

      t.timestamps
    end
  end
end
