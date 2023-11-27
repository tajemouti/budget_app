class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :icon
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
