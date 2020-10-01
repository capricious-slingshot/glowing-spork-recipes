class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]
  before_action :authorized_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    render layout: "authentication"
  end

  def create
    #truemail validation?
    @user = User.create(user_params)
    if @user.valid?
      #can i redirect to the page they were just on?
      # session[:intended_url] = request.url
      session[:user_id] = @user.id
      redirect_to @user, notice: "Welcome #{@user.name}!"
    else
      flash[:alert] = "Danger Batman"
      render :new, layout: "authentication"
    end
  end

  def edit
    render layout: "authentication"
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Successfully Updated #{@user.name}"
    else
      flash[:alert] = "Danger Batman"
      render :edit, layout: "authentication"
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
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def authorized_user
    # binding.pry
    @user = User.find(params[:id])
    
    unless current_user?(@user) || current_user.admin?
      redirect_to root_url, notice: "Access Denied" 
    end
  end

end