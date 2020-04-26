class V1::UsersController < ApplicationController

	before_action :set, only: [:show, :update, :destroy]

	def index
		users = User.all
		render json: users, status: :ok
	end

	def create
		user = User.new(get_params)

		if user.save!
      render json: user, status: :created
    else
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
			render json: {deleted: @user[:id]}, status: :ok
		else 
			render json: @user.errors, status: :error
		end
  end

	  private
    # Use callbacks to share common setup or constraints between actions.
    def set
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def get_params
      params.require(:user).permit(:name, :email)
    end
end
