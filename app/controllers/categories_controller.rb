class CategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1 or /categories/1.json
  def show
  end
  
  def new_arrivals
    @products = Product.where(date_stocked: (Time.now.midnight - 3.months)..Time.now.midnight)
  end
  
  def new_arrivals_filter
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
      @products = Product.joins(:collections, :product_variants).where(collections: {title: collectionArray}).where(product_variants: {color: colorArray, size: sizeArray}).where(date_stocked: (Time.now.midnight - 3.months)..Time.now.midnight).uniq
    end
    
    if @filter[:collection] && @filter[:color] && !@filter[:size]
      @products = Product.joins(:collections, :product_variants).where(collections: {title: collectionArray}).where(product_variants: {color: colorArray}).where(date_stocked: (Time.now.midnight - 3.months)..Time.now.midnight).uniq
    end
    
    if @filter[:collection] && @filter[:size] && !@filter[:color]
      @products = Product.joins(:collections, :product_variants).where(collections: {title: collectionArray}).where(product_variants: {size: sizeArray}).where(date_stocked: (Time.now.midnight - 3.months)..Time.now.midnight).uniq
    end
    
    if @filter[:size] && @filter[:color] && !@filter[:collection]
      @products = Product.joins(:product_variants).where(product_variants: {color: colorArray, size: sizeArray}).where(date_stocked: (Time.now.midnight - 3.months)..Time.now.midnight).uniq
    end
    
    if @filter[:collection] && !@filter[:color] && !@filter[:size]
      @products = Product.joins(:collections).where(collections: {title: collectionArray}).where(date_stocked: (Time.now.midnight - 3.months)..Time.now.midnight).uniq
    end
    
    if @filter[:color] && !@filter[:size] && !@filter[:collection]
      @products = Product.joins(:product_variants).where(product_variants: {color: colorArray}).where(date_stocked: (Time.now.midnight - 3.months)..Time.now.midnight).uniq
    end
    
    if @filter[:size] && !@filter[:color] && !@filter[:collection]
      @products = Product.joins(:product_variants).where(product_variants: {size: sizeArray}).where(date_stocked: (Time.now.midnight - 3.months)..Time.now.midnight).uniq
    end
  end
  
  def display_filter
    @category = Category.find(params[:id])
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
      @products = Product.joins(:collections, :product_variants, :categories).where(categories: {id: @category.id}).where(collections: {title: collectionArray}).where(product_variants: {color: colorArray, size: sizeArray}).uniq
    end
    
    if @filter[:collection] && @filter[:color] && !@filter[:size]
      @products = Product.joins(:collections, :product_variants, :categories).where(categories: {id: @category.id}).where(collections: {title: collectionArray}).where(product_variants: {color: colorArray}).uniq
    end
    
    if @filter[:collection] && @filter[:size] && !@filter[:color]
      @products = Product.joins(:collections, :product_variants, :categories).where(categories: {id: @category.id}).where(collections: {title: collectionArray}).where(product_variants: {size: sizeArray}).uniq
    end
    
    if @filter[:size] && @filter[:color] && !@filter[:collection]
      @products = Product.joins(:product_variants, :categories).where(categories: {id: @category.id}).where(product_variants: {color: colorArray, size: sizeArray}).uniq
    end
    
    if @filter[:collection] && !@filter[:color] && !@filter[:size]
      @products = Product.joins(:collections, :categories).where(categories: {id: @category.id}).where(collections: {title: collectionArray}).uniq
    end
    
    if @filter[:color] && !@filter[:size] && !@filter[:collection]
      @products = Product.joins(:product_variants, :categories).where(categories: {id: @category.id}).where(product_variants: {color: colorArray}).uniq
    end
    
    if @filter[:size] && !@filter[:color] && !@filter[:collection]
      @products = Product.joins(:product_variants, :categories).where(categories: {id: @category.id}).where(product_variants: {size: sizeArray}).uniq
    end
  end
  
  def display
    @category = Category.find(params[:id])
    @products = Product.all
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:title)
    end
end
