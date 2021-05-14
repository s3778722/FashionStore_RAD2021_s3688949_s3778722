class HomeController < ApplicationController
  def index
    #cookies.delete :saved_products
    @products = Product.all
    randomize()
    #if form is submitted, add cookies
    if params.include?(:product_id)
      add_cookies(params[:product_id])
      redirect_to root_path
    end
    @saved_list = cookies[:saved_products]

    #to select the list item
    #a = JSON.parse(cookies[:saved_productss])
    #@output = a[2]
  end

  def add_cookies(id)
    if cookies[:saved_products].nil?
      cookies[:saved_products] = JSON.generate([id])
    else
      if !cookies[:saved_products].include?(id)
        current = JSON.parse cookies[:saved_products]
        current << id
        cookies[:saved_products] = JSON.generate current
      end
    end
  end

  def delete_cookies(id)
    current = JSON.parse cookies[:saved_products]
    current.delete(id)
    cookies[:saved_products] = JSON.generate current
  end

  def randomize
    if cookies[:saved_products] != nil
      cookie_parse = JSON.parse(cookies[:saved_products])
      @last_cookie = cookie_parse.last
      @random_product = Product.offset(rand(Product.count)).first
      while @last_cookie.to_i == @random_product.id
        @random_product = Product.offset(rand(Product.count)).first
        break if @last_cookie.to_i != @random_product.id
      end
    else
      @random_product = Product.offset(rand(Product.count)).first
    end
  end
end