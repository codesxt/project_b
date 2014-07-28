class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    redirect_to new_user_registration_path
  end

  def create
  end

  def edit
    redirect_to edit_user_registration_path(params[:id])
  end

  def update
  end

  def destroy
  end
end
