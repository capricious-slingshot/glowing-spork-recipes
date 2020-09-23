class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]
  before_action :authorized_user, only: [:edit, :update, :destroy]

  def index
    #if admin
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
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Account Succesfully Deleted!"
    #if admin redirect to @users
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def authorized_user
    redirect_to root_path unless current_user?(User.find(params[:id]))
  end
  
end