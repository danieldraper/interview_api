module TokenAuthentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_api_key
  end

  def current_merchant
    @current_merchant
  end

  private

  def authenticate_api_key
    api_token = request.headers["X-API-Key"]
    @current_merchant = Merchant.find_by(api_token:)

    raise MissingError if api_token.blank?
    raise InvalidError if @current_merchant.nil?
  end

  class MissingError < StandardError; end
  class InvalidError < StandardError; end
end
