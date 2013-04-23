class SessionsController < ApplicationController
  skip_before_filter :log_in, :except => [:change_password]

  def help
  end

  def new
  end

  def create
    user = User.authenticate(params[:user_name], params[:password])
    respond_to do |format|
      if user
        session[:user_id] = user.id
        format.html {redirect_to root_path, notice: "Logged in!"}
      else
        format.html {redirect_to log_in_path, notice: "Invalid user name or password"}
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out"
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
