class UsersController < ApplicationController
  skip_before_filter :log_in, :only => [:new, :create, :forgot_pw, :retrieve_pw]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    params[:id] ||= current_user.id
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        user = User.authenticate(@user.user_name, params[:user]["password"])
        if user
          session[:user_id] = user.id
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: "new" }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(User.parse_params_for_habtms(params)[:id])

    #Uploaded documents are not attributes of user and aren't updated as such
    if params[:user][:document]
      Document.upload_doc(params[:user][:document],current_user)
      params[:user].delete :document
    end

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def forgot_pw
  end

  def retrieve_pw
    o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
    tmp_pw  =  (0...15).map{ o[rand(o.length)] }.join
    user = User.find_by_email params[:email]
    if user
      user.tmp_password_hash = BCrypt::Engine.hash_secret(tmp_pw, user.password_salt)
      if user.save
        UserMailer.password_reset(user, tmp_pw).deliver
        redirect_to log_in_path, :notice => "Email sent to #{params[:email]}"
      else
        redirect_to log_in_path, :notice => "Error resetting password."
      end
    else
      redirect_to log_in_path, :notice => "Error resetting password."
    end
  end
end
