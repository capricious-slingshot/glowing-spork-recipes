class SessionsController < ApplicationController
  
  def new
    render layout: "authentication"
  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id

      redirect_to (session[:intended_url] || user), notice: "Welcome back, #{user.name}"
      session[:intended_url] = nil
    else
      flash.now[:alert] = "Invalid Credientals"
      render :new, layout: "authentication"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Successfullly Loged Out!"
  end
end