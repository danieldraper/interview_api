class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.references :merchant, null: false, foreign_key: true
      t.string :token, null: false, index: {unique: true}
      t.date :expiry, null: false
      t.string :name, null: false
      t.string :brand, null: false

      t.timestamps
    end
  end
end
