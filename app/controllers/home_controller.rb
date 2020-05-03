class HomeController < ApplicationController
  before_action :authenticate_request!

  def index
    render json: {'logged_in' => true}, status: :ok
  end
end
