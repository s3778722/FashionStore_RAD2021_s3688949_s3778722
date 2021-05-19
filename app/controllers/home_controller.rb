class HomeController < ApplicationController
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i 

  def index
    #uncomment this to delete cookies
    #cookies.delete :saved_products
    @products = Product.all
    randomize()
    #if form is submitted, add cookies
    if params.include?(:product_id)
      add_cookies(params[:product_id])
      redirect_to root_path
    end

    if params.include?(:address)
      puts "working"
      newsletter_signup(params[:address])
    end

    @saved_list = cookies[:saved_products]

    #to select the list item
    #a = JSON.parse(cookies[:saved_productss])
    #@output = a[2]
  end

  def support
  end

  def gateway
  end

  def profile
    if current_user.nil?
      redirect_to gateway_path
    end
  end

  def add_cookies(id)
    if cookies[:saved_products].nil?
      cookies[:saved_products] = JSON.generate([id])
      #add each product saved with +1 score
      product = Product.find(id)
      product.popularity += 1
      product.save
    else
      if !cookies[:saved_products].include?(id)
        current = JSON.parse cookies[:saved_products]
        current << id
        cookies[:saved_products] = JSON.generate current
        #add each product saved with +1 score
        product = Product.find(id)
        product.popularity += 1
        product.save
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

  def is_valid_email? email
    email =~ VALID_EMAIL_REGEX
  end

  def newsletter_signup(address)
    if (is_valid_email?(address))
      NewsletterMailer.send_email(address).deliver
      redirect_to("/", :notice => 'Sent email')
    else
      redirect_to("/", :notice => 'Not a valid email address')
    end
  end
end