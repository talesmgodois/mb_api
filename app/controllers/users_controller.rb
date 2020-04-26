class UsersController < ApplicationController
  def new
  end

  def hi
    render json: {name: 'Tales'}, status: :ok
  end
end
