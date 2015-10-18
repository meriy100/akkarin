class User::ShortCcsController < UserController
  before_action :set_short_cc, only: [:show, :edit, :update, :destroy]

  # GET /short_ccs
  # GET /short_ccs.json
  def index
    @short_ccs = ShortCc.where user: @user
  end

  # GET /short_ccs/1
  # GET /short_ccs/1.json
  def show
  end

  # GET /short_ccs/new
  def new
    @short_cc = ShortCc.new
  end

  # GET /short_ccs/1/edit
  def edit
  end

  # POST /short_ccs
  # POST /short_ccs.json
  def create
    @short_cc = ShortCc.new(short_cc_params)
    @short_cc.user = @user
    @short_cc.short_cps.each do |short_cp|
      short_cp.user = @user
    end
    respond_to do |format|
      if @short_cc.save
        format.html { redirect_to user_short_cc_path(@short_cc), notice: 'Short cc was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /short_ccs/1
  # PATCH/PUT /short_ccs/1.json
  def update
    respond_to do |format|
      if @short_cc.update(short_cc_params)
        format.html { redirect_to @short_cc, notice: 'Short cc was successfully updated.' }
        format.json { render :show, status: :ok, location: @short_cc }
      else
        format.html { render :edit }
        format.json { render json: @short_cc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /short_ccs/1
  # DELETE /short_ccs/1.json
  def destroy
    @short_cc.destroy
    respond_to do |format|
      format.html { redirect_to user_short_ccs_path, notice: 'Short cc was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_cc
      @short_cc = ShortCc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def short_cc_params
      params.require(:short_cc).permit(:category_id, :sub_category_id,
      short_cps_attributes: [
        :id, :price, :_destroy
      ]
    )
    end
end
