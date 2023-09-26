class UsersController < ApplicationController
  def create
    # byebug
    if params[:password] === params[:password_confirmation]
      user = User.create(user_params)
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation)
  end

end
