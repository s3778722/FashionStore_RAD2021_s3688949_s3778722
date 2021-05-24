class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end


  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to signup_path, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: signup_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def rating
    if current_user != nil
      current_user.rated = true
      current_user.save
    end
  end

  def forget_password
    if params.include?(:forget_pw_username) && params.include?(:email_to_receive)
      user = User.find_by(username: params[:forget_pw_username])
      if user
        user.login_token = create_token
        user.token_generated_at = Time.now.utc
        user.save
        #Used a email that we have accessed to, instead of the user's email in real life situation
        LoginTokenMailer.send_email(params[:email_to_receive], user.login_token, user.username).deliver
        redirect_to(root_path, :notice => 'Sent Temporary Login Link')
      else
        redirect_to forget_password_get_path, notice: 'Username not found'
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)

    end

    def create_token
      SecureRandom.hex(10)
    end

    def token_validity
      2.hours
    end
end
