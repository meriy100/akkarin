class TransfersController < ApplicationController
  before_action :set_transfer, only: [:show, :edit, :update, :destroy]

  # GET /transfers
  # GET /transfers.json
  def index
    @transfers = Transfer.where user: @user
  end

  # GET /transfers/1
  # GET /transfers/1.json
  def show
  end

  # GET /transfers/new
  def new
    @transfer = Transfer.new user: @user, date: Date.today
    @message = "controller"
    puts @transfer.user
    puts @transfer.date
  end

  # GET /transfers/1/edit
  def edit
  end

  # POST /transfers
  # POST /transfers.json
  def create
    @transfer = Transfer.new(transfer_params)

    respond_to do |format|
      if @transfer.save
        format.html { redirect_to @transfer, notice: 'Transfer was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /transfers/1
  # PATCH/PUT /transfers/1.json
  def update
    respond_to do |format|
      if @transfer.update(transfer_params)
        reset_wallet
        format.html { redirect_to @transfer, notice: 'Transfer was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /transfers/1
  # DELETE /transfers/1.json
  def destroy
    @transfer.destroy
    respond_to do |format|
      format.html { redirect_to transfers_url, notice: 'Transfer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transfer
      @transfer = Transfer.find(params[:id])
    end

    def reset_wallet
      from = @transfer.from_wallet
      to = @transfer.to_wallet
      from.price = from.price + @transfer.price + @transfer.commission
      to.price = to.price - @transfer.price
      from.save
      to.save
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transfer_params
      params.require(:transfer).permit(:user_id, :price, :date, :from_wallet_id, :to_wallet_id, :commission)
    end
end
