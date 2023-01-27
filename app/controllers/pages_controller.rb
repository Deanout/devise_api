class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  before_action :authenticate_devise_api_token!, only: [:restricted]
  def home
  end
  # /pages/restricted
  def restricted
    devise_api_token = current_devise_api_token
    if devise_api_token
      render json: { message: "You are logged in as #{devise_api_token.resource_owner.email}" }, status: :ok
    else
      render json: { message: 'You are not logged in' }, status: :unauthorized
    end
  end
end
