class SessionsController < ApplicationController
  skip_before_filter :log_in, :except => [:change_password]

  def help
  end

  def new
  end

  def create
    user = User.authenticate(params[:user_name], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to welcome_path, :notice=> "Logged in!"
    else
      flash.now.alert = "Invalid user name or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out"
  end

  def welcome
  end

  def change_password
  end

  def update_password
    u = User.authenticate User.find(params["id"]).user_name, params["curr"]
    if u && params["new"] == params["conf_new"]
      u.password = params["new"]
      u.save
      redirect_to root_url, :notice => "Password updated"
    else 
      redirect_to change_password_path, :notice => "Incorrect password or mismatched new password and confirmation"
    end
  end
end
