class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    flash[:notice] = "test"
    @users = User.all
  end

  def show

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
      redirect_to @user, notice: "User Successfully Updated"
    else
      flash[:alert] = "Danger Batman"
      render :edit, layout: "authentication"
    end
  end

  def destroy
    @user.destroy
    redirect_to root_url, notice: "Account Succesfully Deleted!"
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end
  
end