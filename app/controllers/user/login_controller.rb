class User::LoginController < UserController
  skip_before_filter :authenticated
  def index
  end

  def login
    user = User.find_by(name: params[:login_name])
    if user && user.authenticate(params[:password]) then
      session[:user_id] = user.id
      return redirect_to user_top_path
    end
    render 'index'
  end

  def logout
    reset_session
    return redirect_to user_login_path
  end

end
