class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.page(params[:page]).per(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
    @document = Document.new
    @group_messages = GroupMessage.where(:group_id => @group.id).all.sort_by(&:created_at).reverse[0..99]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        @group_membership = GroupMembership.create :group => @group, :user => current_user, :role => MembershipRoles.admin
        GroupMessage.create! :group_id => @group.id, :message => "#{@group.name.capitalize} was created by #{current_user.user_name}"
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = Group.find(params[:id])

    #Uploaded documents are not attributes of user and aren't updated as such
    if params[:group][:document]
      Document.upload_doc(params[:group][:document], @group)
      GroupMessage.create! :group_id => @group.id, :message => "#{params[:group][:document].original_filename} was uploaded #{current_user.user_name}"
      params[:group].delete :document
    end

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    if @group.admin?( current_user) &&  (@group.members.length == 1)
      @group = Group.find(params[:id])
      @group.destroy

      respond_to do |format|
        format.html { redirect_to groups_url }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to @group, notice: "Action not permitted. Groups must be empty to be deleted and can only be deleted by admins" }
        format.json { head :no_content }
      end
    end    
  end
end
