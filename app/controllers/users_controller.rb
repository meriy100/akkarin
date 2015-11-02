class UsersController < ApplicationController
  skip_before_filter :authenticated
  before_action :set_user, only: :show
  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    respond_to do |format|
      if @user.save
        format.html {redirect_to @user, notice: "User was successfully created"}
      else
        format.html { render :new}
      end
    end
  end

  def show
  end

  private
  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
