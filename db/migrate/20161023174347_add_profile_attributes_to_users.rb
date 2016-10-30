# frozen_string_literal: true
class AddProfileAttributesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :profile_picture, :string
    add_column :users, :level, :string
  end
end
