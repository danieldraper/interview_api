class API::V1::MerchantsController < API::V1::BaseController
  def show
    render json: {
      object: :merchant,
      **current_merchant.attributes.slice("name", "currencies_allowed"),
      number_of_cards: current_merchant.cards.size,
      number_of_purchases: current_merchant.purchases.size,
    }
  end
end
