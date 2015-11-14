class ServiceController < ApplicationController
  before_action :set_short_cc, only: :create
  before_action :set_short_cp, only: :create
  def index
    @short_ccs = ShortCc.where user: @user
    if params[:q]
      @search = Record.search(params[:q])
    elsif
      @search = Record.search({date_gteq: 7.days.ago, date_lteq: Date.today})
    end
    @records = @search.result.where(user: @user)
    @chart_data = @records.group(:date).sum :price
    @wallets = Wallet.where user: @user
  end

  def create
    @record = Record.new user: @user,
      category: @short_cc.category, sub_category: @short_cc.sub_category,
      price: @short_cp.price, date: Date.today
    @record.save
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
