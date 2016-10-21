class CreateTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :templates do |t|
      t.string :name
      t.string :format
      t.string :column_1
      t.string :column_2
      t.string :column_3

      t.timestamps
    end
  end
end
