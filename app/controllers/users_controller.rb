# app/controllers/users_controller.rb
#require 'pry'

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    #binding.pry
    @user_session = user_session
    @current_user = current_user
    #@user = User.find(user_session[:user_id])

    # if !user_signed_in?
    #   redirect_to '/users/sign_in'
    # else
    #   redirect_to '/users/#{user_session[:user_id]}'
    # end
  end

  def new
    @user = User.new
  end

  def create
    # call user_params when creating a new user
    @user = User.new()

    if @user.save
      redirect_to '/users/#{@user.user_id}'
    else
      render :new
    end
  end

  def show
    if params[:id]=="sign_out"
      redirect_to '/users/sign_in'
    else
      @user = User.find(params[:id])
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end


  end

  def user_params
    # this method will return a hash like this:
    # { title: "whatever title", author: "some person", body: "blah blah blah" }
    params.require(:user).permit( :email, :password)
  end
end
