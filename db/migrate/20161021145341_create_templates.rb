# frozen_string_literal: true
class CreateTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :templates do |t|
      t.string :name
      t.string :format
      t.text :headers, array: true, default: []
      t.text :item_fields, array: true, default: []
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
