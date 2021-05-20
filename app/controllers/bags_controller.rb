class BagsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_bag, only: %i[ show edit update destroy ]
  before_action :logged_in?
  helper_method :checkout

  # GET /bags or /bags.json
  def index
    @bags = Bag.all
  end

  def cart
    @bags = Bag.all
  end

  def checkout
    if request.post?
      @current_user.bags.where(purchased: 'false').each do |i|
        i.update(purchased: 'true')
      end
    end
    redirect_to cart_path, notice: 'Transaction succesful'
  end

  # GET /bags/1 or /bags/1.json
  def show
  end

  # GET /bags/new
  def new
    @bag = Bag.new
  end

  # GET /bags/1/edit
  def edit
  end

  # POST /bags or /bags.json
  def create
    bag_params1 = bag_params
    
    pr = Product.find(bag_params1[:product_id])

    bag_params1[:product_variant_id] = pr.product_variants.find_by(size: params[:size], color: params[:color]).id
    @bag = Bag.new(bag_params1)

    respond_to do |format|
      if @bag.save
        format.html { redirect_to @bag, notice: "Bag was successfully created." }
        format.json { render :show, status: :created, location: @bag }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bags/1 or /bags/1.json
  def update
    respond_to do |format|
      if @bag.update(bag_params)
        format.html { redirect_to @bag, notice: "Bag was successfully updated." }
        format.json { render :show, status: :ok, location: @bag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bags/1 or /bags/1.json
  def destroy
    @bag.destroy
    respond_to do |format|
      format.html { redirect_to bags_url, notice: "Bag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bag
      @bag = Bag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bag_params
      params.require(:bag).permit(:user_id, :quantity, :product_id, :product_variant_id, :purchased)
    end
end
