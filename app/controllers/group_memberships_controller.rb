class GroupMembershipsController < ApplicationController
  # GET /group_memberships
  # GET /group_memberships.json
  def index
    @group_memberships = GroupMembership.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @group_memberships }
    end
  end

  # GET /group_memberships/1
  # GET /group_memberships/1.json
  def show
    @group_membership = GroupMembership.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group_membership }
    end
  end

  # GET /group_memberships/new
  # GET /group_memberships/new.json
  def new
    @group_membership = GroupMembership.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group_membership }
    end
  end

  # GET /group_memberships/1/edit
  def edit
    @group_membership = GroupMembership.find(params[:id])
  end

  # POST /group_memberships
  # POST /group_memberships.json
  def create
    @group_membership = GroupMembership.new :user_id => params[:user_id], :group_id => params[:group_id], :role => MembershipRoles.pending

    respond_to do |format|
      if @group_membership.save
        format.html { redirect_to Group.find(params[:group_id]), notice: 'Group membership was requested and is pending review by the groups admin.' }
        format.json { render json: @group_membership, status: :created, location: @group_membership }
      else
        format.html { redirect_to Group.find(params[:group_id]), notice: 'Group membership request encountered an error.' }
        format.json { render json: @group_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /group_memberships/1
  # PUT /group_memberships/1.json
  def update
    @group_membership = GroupMembership.find(params[:id])
    if @group_membership.joining? params
      GroupMessage.create! :group_id => @group_membership.group_id, :message => "#{User.find(@group_membership.user_id).user_name} joined #{Group.find(@group_membership.group_id).name}"
    end

    respond_to do |format|
      if @group_membership.update_attributes(:role => params[:role])
        format.html { redirect_to Group.find(@group_membership.group_id), notice: "#{User.find(@group_membership.user_id).user_name} accepted." }
      else
        format.html { redirect_to Group.find(@group_membership.group_id), notice: "Error accepting #{User.find(@group_membership.user_id).user_name}." }
      end
    end
  end

  # DELETE /group_memberships/1
  # DELETE /group_memberships/1.json
  def destroy
    @group_membership = GroupMembership.find(params[:id])
    @group_membership.destroy
    GroupMessage.create! :group_id => @group_membership.group_id, :message => "#{User.find(@group_membership.user_id).user_name} left #{Group.find(@group_membership.group_id).name}"

    respond_to do |format|
      format.html { redirect_to Group.find(@group_membership.group_id), notice: "#{User.find(@group_membership.user_id).user_name} rejected." }
    end
  end
end
