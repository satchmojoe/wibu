class GroupMessagesController < ApplicationController
  # GET /group_messages
  # GET /group_messages.json
  def index
    @group_messages = GroupMessage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @group_messages }
    end
  end

  # GET /group_messages/1
  # GET /group_messages/1.json
  def show
    @group_message = GroupMessage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group_message }
    end
  end

  # GET /group_messages/new
  # GET /group_messages/new.json
  def new
    @group_message = GroupMessage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group_message }
    end
  end

  # GET /group_messages/1/edit
  def edit
    @group_message = GroupMessage.find(params[:id])
  end

  # POST /group_messages
  # POST /group_messages.json
  def create
    @group_message = GroupMessage.new(params[:group_message])

    respond_to do |format|
      if @group_message.save
        format.html { redirect_to @group_message, notice: 'Group message was successfully created.' }
        format.json { render json: @group_message, status: :created, location: @group_message }
      else
        format.html { render action: "new" }
        format.json { render json: @group_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /group_messages/1
  # PUT /group_messages/1.json
  def update
    @group_message = GroupMessage.find(params[:id])

    respond_to do |format|
      if @group_message.update_attributes(params[:group_message])
        format.html { redirect_to @group_message, notice: 'Group message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_messages/1
  # DELETE /group_messages/1.json
  def destroy
    @group_message = GroupMessage.find(params[:id])
    @group_message.destroy

    respond_to do |format|
      format.html { redirect_to group_messages_url }
      format.json { head :no_content }
    end
  end
end
