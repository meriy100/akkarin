class UserController < ApplicationController
  layout 'user'
  before_action :set_user
  before_filter :authenticated
  def index
    redirect_to user_expense_items_path
  end
  def authenticated
    if session[:user_id]
      begin
        @user = User.find_by(id: session[:user_id])
      rescue ActiveRecord::RecordNotFound
        reset_session
      end
    end
    redirect_to login_path unless @user
  end
  def set_user
    @user = session[:user_id]
  end
end
