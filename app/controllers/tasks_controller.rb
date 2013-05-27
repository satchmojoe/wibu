class TasksController < ApplicationController
  before_filter :group_member

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new :project_id => params[:project_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task.project, notice: 'Task was successfully created.' }
        format.json { render json: @task.project, status: :created, location: @task.project }
      else
        format.html { render action: "new" }
        format.json { render json: @task.project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task.project, notice: 'Task was successfully updated.' }
        format.json { render json: @task.project, status: :created, location: @task.project }
      else
        format.html { render action: "new" }
        format.json { render json: @task.project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to @task.project }
      format.json { head :no_content }
    end
  end
  private

  def group_member
    permission = false
    permission = Group.find(Task.find(params[:id]).group_id).members.include?(current_user) if params[:id]
    permission = Group.find(Project.find(params[:project_id]).group_id).members.include?(current_user) if params[:project_id]
    permission = Group.find(Project.find(params[:task][:project_id]).group_id).members.include?(current_user) if params[:task] and params[:task][:project_id]
    permission =  Group.find(params[:group_id]).members.include?(current_user) if params[:group_id]
    if !permission
      respond_to do |format|
        format.html { redirect_to root_path}
        format.json { head :no_content }
      end
    end
  end
end
