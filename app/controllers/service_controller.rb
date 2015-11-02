class ServiceController < ApplicationController
  before_action :set_short_cc, only: :create
  before_action :set_short_cp, only: :create
  def index
    @short_ccs = ShortCc.where user: @user
    # @expese_items: [[date, expense_items.where date: date], .... ]
    @expense_items = ExpenseItem.weekly_split @user
    # ハッシュの場合
    @chart_data = {'2014-04-01' => 60, '2014-04-02' => 65, '2014-04-03' => 64}
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
