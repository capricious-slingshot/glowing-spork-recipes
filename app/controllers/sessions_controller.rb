class SessionsController < ApplicationController
  def new
    render layout: "authentication"
  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to user, notice: "Welcome back, #{user.name}"
    else
      flash.now[:alert] = "Invalid Credientals"
      render :new, layout: "authentication"
    end
  end
end