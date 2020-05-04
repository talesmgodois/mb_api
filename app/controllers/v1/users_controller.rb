class V1::UsersController < ApplicationController
  before_action :authenticate_request!, except: [:create]
	before_action :set, only: [:show, :update, :destroy]

	def index
		users = User.all
		render json: users, status: :ok
	end

  def create
    user = User.new(get_params)
    begin
      user.save!
      render json: user, status: :created
    rescue => exception
      render json: user.errors, status: :unprocessable_entity
    end
	end

	def show
		render json: @user
	end

	  # PATCH/PUT /users/1
  def update
    if @user.update(get_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    if @user.destroy
      head(:ok)
		else 
			head(:unprocessable_entity)
		end
  end

	  private
    # Use callbacks to share common setup or constraints between actions.
    def set
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def get_params
      params[:user][:password] = params[:password] unless params[:user][:password]
      params[:user][:password_confirmation] = params[:password_confirmation] unless params[:user][:password_confirmation]
      params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
end
