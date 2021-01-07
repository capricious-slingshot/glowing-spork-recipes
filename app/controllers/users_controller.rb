class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]
  before_action :find_user, only: [:edit, :update, :destroy]
  before_action :authorize, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    render layout: "authentication"
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      #can i redirect to the page they were just on?
      # session[:intended_url] = request.url
      #redirect_back_or obj
      # binding.pry
      session[:user_id] = @user.id
      redirect_to user_recipes_url(@user), notice: "Welcome #{@user.name.capitalize}! Finish Setting Up Your Account!"
    else
      flash.now[:alert] = "Danger Batman"
      render :new, layout: "authentication"
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to user_recipes_url(@user), notice: "Successfully Updated #{@user.name}"
    else
      flash.now[:alert] = "Danger Batman"
      render :edit
    end
  end

  def destroy
    if current_user.admin?
      @user.destroy
      redirect_to users_path, notice: "#{@user.name} Succesfully Deleted!"
    elsif current_user?(@user)
      @user.destroy
      session[:user_id] = nil
      redirect_to root_url, notice: "Account Succesfully Deleted!"
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :photo, :bio, :location, :public_profile)
  end

  def find_user
    binding.pry
    @user = User.find_by(slug: params[:id])
  end

  def authorize
    redirect_to root_url, notice: "Access Denied" unless authorized_user?(@user)
  end

end