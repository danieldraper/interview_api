# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

merchant_one = Merchant.create_with(
  enabled_at: "2024-01-01",
  currencies_allowed: Constants::SUPPORTED_CURRENCIES.fetch_values(:aud),
  api_token: SecureRandom.uuid,
).find_or_create_by(
  name: "Fusion Enterprises",
)

merchant_two = Merchant.create_with(
  currencies_allowed: Constants::SUPPORTED_CURRENCIES.fetch_values(:aud),
  api_token: SecureRandom.uuid,
  ).find_or_create_by(
    name: "Zenith Solutions",
)

merchant_three = Merchant.create_with(
  enabled_at: "2024-01-01",
  currencies_allowed: Constants::SUPPORTED_CURRENCIES.fetch_values(:usd, :cad),
  api_token: SecureRandom.uuid,
  ).find_or_create_by(
  name: "Apex Innovations",
)

expired_cards = []
10.times do |n|
  expired_cards << {
    merchant_id: [merchant_one.id, merchant_two.id, merchant_three.id].sample,
    token: SecureRandom.hex(8),
    expiry: Faker::Date.between(from: 1.year.ago.to_date, to: Date.yesterday),
    name: Faker::Name.name,
    brand:  Constants::SUPPORTED_CARD_BRANDS.values.sample,
  }
end
Card.upsert_all(expired_cards, unique_by: :token)

cards = []
100.times do |n|
  cards << {
    merchant_id: [merchant_one.id, merchant_two.id, merchant_three.id].sample,
    token: SecureRandom.hex(8),
    expiry: Faker::Date.between(from: Date.current, to: 7.years.from_now.to_date),
    name: Faker::Name.name,
    brand:  Constants::SUPPORTED_CARD_BRANDS.values.sample,
  }
end
Card.upsert_all(cards, unique_by: :token)

card_ids = Card.pluck(:id)
purchases = []
10_000.times do |n|
  merchant = [merchant_one, merchant_two, merchant_three].sample

  purchases << {
    merchant_id: merchant.id,
    card_id: card_ids.sample,
    reference: SecureRandom.hex(8),
    amount: rand(1..100_000_000),
    currency: merchant.currencies_allowed.sample,
    state: Purchase.states.values.sample,
  }
end
Purchase.upsert_all(purchases, unique_by: :reference)
