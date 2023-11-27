class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.string :name
      t.integer :amount
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
