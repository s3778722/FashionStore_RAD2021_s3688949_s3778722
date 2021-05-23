class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /popular or /products.json
  def popular
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end
  
  def all
    @products = Product.all
  end
  
  def search
    search_term = params[:term]
    @products = Product.all
    @products = Product.joins(:product_variants).where('title like ?', "%#{search_term}%").or(Product.joins(:product_variants).where('product_variants.color like ?', "%#{search_term}%")).uniq
  end
  
  def all_filter
    @filter = params
    if @filter[:collection]
      collectionArray = Array.new
      @filter[:collection].each do |e|
        collectionArray << e[1]
      end
    end
    if @filter[:color]
      colorArray = Array.new
      @filter[:color].each do |c|
        colorArray << c[1]
      end
    end
    if @filter[:size]
      sizeArray = @filter[:size]
    end
    
    @products = Product.all
    
    if @filter[:collection] && @filter[:color] && @filter[:size]
      @products = Product.joins(:collections, :product_variants).where(collections: {title: collectionArray}).where(product_variants: {color: colorArray, size: sizeArray}).uniq
    end
    
    if @filter[:collection] && @filter[:color] && !@filter[:size]
      @products = Product.joins(:collections, :product_variants).where(collections: {title: collectionArray}).where(product_variants: {color: colorArray}).uniq
    end
    
    if @filter[:collection] && @filter[:size] && !@filter[:color]
      @products = Product.joins(:collections, :product_variants).where(collections: {title: collectionArray}).where(product_variants: {size: sizeArray}).uniq
    end
    
    if @filter[:size] && @filter[:color] && !@filter[:collection]
      @products = Product.joins(:product_variants).where(product_variants: {color: colorArray, size: sizeArray}).uniq
    end
    
    if @filter[:collection] && !@filter[:color] && !@filter[:size]
      @products = Product.joins(:collections).where(collections: {title: collectionArray}).uniq
    end
    
    if @filter[:color] && !@filter[:size] && !@filter[:collection]
      @products = Product.joins(:product_variants).where(product_variants: {color: colorArray}).uniq
    end
    
    if @filter[:size] && !@filter[:color] && !@filter[:collection]
      @products = Product.joins(:product_variants).where(product_variants: {size: sizeArray}).uniq
    end
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :desc, :price, :date_stocked, :popularity)
    end
end
