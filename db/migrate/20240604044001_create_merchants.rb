class CreateMerchants < ActiveRecord::Migration[7.1]
  def change
    create_table :merchants do |t|
      t.string :name, null: false
      t.datetime :enabled_at
      t.json :currencies_allowed, null: false, default: []
      t.string :api_token, null: false, index: {unique: true}

      t.timestamps

      t.check_constraint "JSON_TYPE(currencies_allowed) = 'array'", name: "merchant_currencies_allowed_is_array"
    end
  end
end
