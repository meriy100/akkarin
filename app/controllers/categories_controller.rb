class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.where user: @user
    @category = Category.new
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    @category.user = @user
    respond_to do |format|
      if @category.save
        format.html { redirect_to category_path(@category), notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
        format.js
      else
        format.html { render :new }
        format.js   { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_path(@category), notice: 'Category was successfully created.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(
        :name, :color_id, :user_id, :wallet_id,
        short_ccs_attributes: [
          :id, :_destroy,
          short_cps_attributes: [
            :id, :price, :_destroy
          ],
        ],
        sub_categories_attributes: [
          :id, :name, :_destroy,
          short_ccs_attributes: [
            :id, :_destroy,
            short_cps_attributes: [
              :id, :price, :_destroy
            ],
          ]
        ],
      )
    end
end
