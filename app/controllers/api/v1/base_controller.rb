class API::V1::BaseController < API::BaseController
  include TokenAuthentication

  rescue_from TokenAuthentication::MissingError do
    render json: {
      object: :api_error,
      message: "Must provide the header X-API-Key",
    }
  end

  rescue_from TokenAuthentication::InvalidError do
    render json: {
      object: :api_error,
      message: "Must provide a valid X-API-Key",
    }
  end
end
