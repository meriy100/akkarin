class ShotCpsController < ApplicationController
  before_action :set_shot_cp, only: [:show, :edit, :update, :destroy]

  # GET /shot_cps
  # GET /shot_cps.json
  def index
    @shot_cps = ShotCp.all
  end

  # GET /shot_cps/1
  # GET /shot_cps/1.json
  def show
  end

  # GET /shot_cps/new
  def new
    @shot_cp = ShotCp.new
  end

  # GET /shot_cps/1/edit
  def edit
  end

  # POST /shot_cps
  # POST /shot_cps.json
  def create
    @shot_cp = ShotCp.new(shot_cp_params)

    respond_to do |format|
      if @shot_cp.save
        format.html { redirect_to @shot_cp, notice: 'Shot cp was successfully created.' }
        format.json { render :show, status: :created, location: @shot_cp }
      else
        format.html { render :new }
        format.json { render json: @shot_cp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shot_cps/1
  # PATCH/PUT /shot_cps/1.json
  def update
    respond_to do |format|
      if @shot_cp.update(shot_cp_params)
        format.html { redirect_to @shot_cp, notice: 'Shot cp was successfully updated.' }
        format.json { render :show, status: :ok, location: @shot_cp }
      else
        format.html { render :edit }
        format.json { render json: @shot_cp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shot_cps/1
  # DELETE /shot_cps/1.json
  def destroy
    @shot_cp.destroy
    respond_to do |format|
      format.html { redirect_to shot_cps_url, notice: 'Shot cp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shot_cp
      @shot_cp = ShotCp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shot_cp_params
      params.require(:shot_cp).permit(:short_cc_id, :user_id, :price)
    end
end
