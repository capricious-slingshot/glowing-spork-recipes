class SessionsController < ApplicationController
  
  def new
    render layout: "authentication"
  end

  def create
    auth_hash = request.env["omniauth.auth"]
    ominauth_email = auth_hash["info"]["email"] if auth_hash.present?
    if auth_hash && ominauth_email == nil
      flash.now[:alert] = "There was a problem. Please check your Privacy Settings in Github"
      redirect_to :new, layout: "authentication"
    elsif auth_hash && ominauth_email.present?
      user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id]  = user.id

      redirect_to root_path, notice: "Welcome #{user.name}!"
    elsif user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id

      redirect_to (session[:intended_url] || user_recipes_path(user)), notice: "Welcome back, #{user.name}"
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