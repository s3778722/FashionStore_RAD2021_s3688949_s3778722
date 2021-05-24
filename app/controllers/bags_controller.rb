class BagsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_bag, only: %i[ show edit update destroy ]
  before_action :logged_in?, except: %i[create]
  helper_method :checkout

  # GET /bags or /bags.json
  def index
    @bags = Bag.all
  end

  def cart
    @bags = Bag.all
    #Add a product to cart if there is an item persisted via session cookies
    if session[:tmp_cart_pid] != nil || session[:tmp_cart_vid] != nil
      Bag.create(user_id: @current_user.id, quantity: session[:tmp_quantity], product_id: session[:tmp_cart_pid],
       product_variant_id: session[:tmp_cart_vid], purchased: false)
       session[:tmp_cart_pid] = nil
       session[:tmp_cart_vid] = nil
       session[:tmp_quantity] = nil
    end
  end

  def checkout
    if @current_user.bags.where(purchased: 'false').count == 0
      redirect_to cart_path, notice: 'Bag is empty'
    elsif request.post?
      @current_user.bags.where(purchased: 'false').each do |i|
        i.update(purchased: 'true')
      end
      if @current_user.rated == false
        redirect_to rating_path, notice: 'Transaction successful'
      else
        redirect_to cart_path, notice: 'Transaction successful'
      end
    end
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
    #if user is not logged in, store all the attributes under its own session cookies.
    if current_user.nil?
      p = Product.find(session[:tmp_cart_pid])
      pv_id = p.product_variants.find_by(size: params[:size], color: params[:color]).id
      session[:tmp_cart_vid] = pv_id
      session[:tmp_quantity] = bag_params[:quantity]
      redirect_to signin_path
    else
      bag_params1 = bag_params
      pr = Product.find(bag_params1[:product_id])
      bag_params1[:product_variant_id] = pr.product_variants.find_by(size: params[:size], color: params[:color]).id
      @bag = Bag.new(bag_params1)

      respond_to do |format|
        if @bag.save
          #Add popularity when successfully added to cart
          product = Product.find(bag_params1[:product_id])
          product.popularity += 1
          product.save
  
          format.html { redirect_to pr, notice: "Item added to cart!" }
          format.json { render :show, status: :created, location: pr }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @bag.errors, status: :unprocessable_entity }
        end
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
