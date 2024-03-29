class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy, :completed]

  def index
    @tasks_new = current_user.tasks.where(completed: false)
    @tasks_complete = current_user.tasks.where(completed: true)
  end

  def show
  end

  def new
    @task = current_user.tasks.build
  end

  def edit
  end

  def create
    @task = current_user.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.js
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.js
    end
  end

  def complete
    @task = Task.find_by_id(params[:id])
    @task.update_attributes(completed: params[:completed])
    respond_to do |format|
      format.html { redirect_to tasks_path, notice: "Task successfully updated" }
      format.js
    end
  end

  def batch_delete
    Task.destroy(params[:task_ids])
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'All selected task was successfully destroyed.' }
      format.js
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      defaults = { completed: false }
      params.require(:task).permit(:title, :description, :priority, :due_date,
                                   :completed).reverse_merge(defaults)
    end
end
