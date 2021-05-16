class FavouritesController < ApplicationController
  before_action :set_favourite, only: %i[ show edit update destroy ]

  # GET /favourites or /favourites.json
  def index
    @favourites = Favourite.all
  end

  def saved_list
    @products = Product.all
    @saved_list = cookies[:saved_products]
    #check if cookie list is not empty, parse the list with JSON if true.
    if cookies[:saved_products] != nil
      @parsed_list = JSON.parse cookies[:saved_products]
    end

    #check if hidden parameters are passed, delete cookie with product id if true.
    if params.include?(:product_id)
      delete_cookies(params[:product_id])
      redirect_to saved_list_path
    end
  end

  def delete_cookies(id)
    current = JSON.parse cookies[:saved_products]
    current.delete(id)
    cookies[:saved_products] = JSON.generate current
  end

  # GET /favourites/1 or /favourites/1.json
  def show
  end

  # GET /favourites/new
  def new
    @favourite = Favourite.new
  end

  # GET /favourites/1/edit
  def edit
  end

  # POST /favourites or /favourites.json
  def create
    @favourite = Favourite.new(favourite_params)

    respond_to do |format|
      if @favourite.save
        format.html { redirect_to @favourite, notice: "Favourite was successfully created." }
        format.json { render :show, status: :created, location: @favourite }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @favourite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favourites/1 or /favourites/1.json
  def update
    respond_to do |format|
      if @favourite.update(favourite_params)
        format.html { redirect_to @favourite, notice: "Favourite was successfully updated." }
        format.json { render :show, status: :ok, location: @favourite }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @favourite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favourites/1 or /favourites/1.json
  def destroy
    @favourite.destroy
    respond_to do |format|
      format.html { redirect_to favourites_url, notice: "Favourite was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favourite
      @favourite = Favourite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favourite_params
      params.require(:favourite).permit(:user_id, :product_id)
    end
end
