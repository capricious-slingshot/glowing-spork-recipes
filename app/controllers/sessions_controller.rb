class SessionsController < ApplicationController
  
  def new
    render layout: "authentication"
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      #they logged in via OAuth - raise auth_hash.inspect - does not work yet - incognito kinda works
      user = User.find_or_create_by_omniauth(auth_hash)

      session[:user_id]  = user.id

      redirect_to root_path       

    elsif user = User.authenticate(params[:email], params[:password])
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

  private

end