class CreatePurchases < ActiveRecord::Migration[7.1]
  def change
    create_table :purchases do |t|
      t.references :merchant, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true
      t.string :reference, null: false, index: {unique: true}
      t.integer :amount, null: false
      t.string :currency, null: false
      t.string :state, null: false

      t.timestamps
    end
  end
end
