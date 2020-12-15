class SessionsController < ApplicationController
  
  def new
    render layout: "authentication"
  end

  def create
    
    if auth_hash = request.env["omniauth.auth"] && !auth_hash["info"]["email"] = nil
      #they logged in via OAuth - raise auth_hash.inspect - does not work yet - incognito kinda works
      #info email is nil { "email"=>nil } 
      #i enabled public email in github profile
      #still not returning an email (auth_hash["info"]["email"] = nil)
      #set a check for null in users table
      #still creating a empty user: #<User:0x00007fc1bd431508 id: nil, name: nil, email: nil, password_digest: "$2a$12$X2QdvVBq1QG0nGJikrxdi.yr/juYlT/XzUmmKAFosiqGHhyLH3YdG", admin: false>
      #added check for present email above (&& !auth_hash["info"]["email"] = nil)
      
      user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id]  = user.id

      redirect_to root_path       

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

  private

end