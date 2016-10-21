class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :name_filter
      t.string :brand
      t.string :collection_filter
      t.string :gender_filter
      t.string :category_1_filter
      t.string :category_2_filter
      t.string :category_3_filter

      t.timestamps
    end
  end
end
