class UsersController < ApplicationController
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
    @user = User.new(user_params)
    if @user.save
      #can i redirect to the page they were just on?
      redirect_to user_path, notice: "Welcome #{@user.name}!"
    else
      render :new, alert: "Danger Batman"
    end
  end

  def edit
    @user = User.find(params[:id])
    render layout: "authentication"
  end

  def update
    #issues abound here
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "User Successfully Updated"
    else
      flash[:alert] = "Danger Batman"
      render :edit, layout: "authentication"
    end
  end

  def destroy
    session.clear
    redirect_to root_path 
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end