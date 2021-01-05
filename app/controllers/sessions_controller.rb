class SessionsController < ApplicationController
  
  def new
    render layout: "authentication"
  end

  def create
    if omni_email.present?
      user = User.find_or_create_by_omniauth(omni_hash)
      session[:user_id]  = user.id
      redirect_to root_path, notice: "Welcome #{user.name}!"
    elsif user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to (session[:intended_url] || user_recipes_path(user)), notice: "Welcome back, #{user.name}"
      session[:intended_url] = nil
    else
      flash.now[:alert] = error_message
      render :new, layout: "authentication"
    end 
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Successfullly Loged Out!"
  end

  private

  def omni_hash
    request.env["omniauth.auth"]
  end

  def omni_email
    omni_hash["info"]["email"] if omni_hash
  end

  def error_message
    omni_hash && omni_email == nil ? "Please Check Your Github Email Privacy Settings" : "Invalid Credientals"
  end
end