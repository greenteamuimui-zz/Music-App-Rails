class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(users_params)
    
  end





private

  def users_params
    params.requrie[:user].permit(:email, :password)
  end
end
