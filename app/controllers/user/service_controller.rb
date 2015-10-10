class User::ServiceController < UserController
  def index
    @short_ccs = ShortCc.where user: @user
  end
end
