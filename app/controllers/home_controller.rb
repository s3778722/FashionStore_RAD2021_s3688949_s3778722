class HomeController < ApplicationController
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  def index
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

  def randomize
    count = Product.count
    rand_offset = rand(count)
    @random_product = Product.offset(rand_offset).first
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