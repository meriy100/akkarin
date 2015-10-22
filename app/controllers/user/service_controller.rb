class User::ServiceController < UserController
  before_action :set_short_cc, only: :create
  before_action :set_short_cp, only: :create
  def index
    @short_ccs = ShortCc.where user: @user
#    @expense_items = ExpenseItem.where user: @user
#    @expense_items.weekly_expenses
    @expense_items = ExpenseItem.weekly_split @user
  end

  def create
    @expense_item = ExpenseItem.new user: @user, category: @short_cc.category, sub_category: @short_cc.sub_category, price: @short_cp.price, date: Date.today
    @expense_item.save
    redirect_to action: :index
  end
  private
  def set_short_cc
    @short_cc = ShortCc.find params[:short_cc]
  end
  def set_short_cp
    @short_cp = ShortCp.find params[:short_cp]
  end
  def short_cc_params
    params.pequire(:short_cc).permit(:category_id, :sub_category_id)
  end
end
