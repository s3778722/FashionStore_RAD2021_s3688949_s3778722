class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Sign in successful"
    else
      flash.now[:alert] = "Username or password is invalid"
      render "new"
    end
  end
  
  # This is for "Forgot Password" authentication.
  def login
    token = params[:token].to_s
    username = params[:username] 
    user = User.find_by(username: username)
    if !user || (user.login_token != token)
      redirect_to root_path, notice: 'It seems your link is invalid. Try requesting for a new login link'
    elsif Time.now.utc > (user.token_generated_at + 2.hours)
      redirect_to root_path, notice: 'Your login link has been expired. Try requesting for a new login link.'
    else
      user.login_token = nil
      user.save
      session[:user_id] = user.id
      redirect_to root_path, notice: 'You have been signed in!'
    end
  end

  def twitter
    p = User.find_by_username(auth.info.screen_name)
    if p
      session[:user_id] = p.id
    else
      User.create(
      username: auth.info.nickname,
      email: 'twitterperson@faketweeter.com',
      password: '123456888795',
      password_confirmation: '123456888795',
      )
      
      p = User.find_by_username(auth.info.nickname)
      session[:user_id] = p.id
    end
      redirect_to root_url, notice: "Login from twitter"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Sign out successful"
  end
  
  def auth
    request.env['omniauth.auth']
  end
end
