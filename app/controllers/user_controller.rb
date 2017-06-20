class UserController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def user_params
    { email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation]}
  end

end
