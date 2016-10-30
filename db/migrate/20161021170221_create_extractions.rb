# frozen_string_literal: true
class CreateExtractions < ActiveRecord::Migration[5.0]
  def change
    create_table :extractions do |t|
      t.references :user, foreign_key: true
      t.references :search, foreign_key: true
      t.references :template, foreign_key: true

      t.timestamps
    end
  end
end
