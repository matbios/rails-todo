class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    Task.create(task_params)
    flash[:notif] = ">— Well done ! Your task has been created ! —<"
    redirect_to task_confirmation_path
  end

  def confirm
    @task = Task.last
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
     @task = Task.find(params[:id])
     @task.update(task_params)
     flash[:notif] = ">— Your task has been updated with success —<"
     redirect_to tasks_path
  end

  def destroy
     @task = Task.find(params[:id])
     @task.destroy
     flash[:notice] = "The task '#{@task.title}’has been deleted !"
     redirect_to tasks_path
  end

  private

  def task_params
       params.require(:task).permit(:title, :description, :status)
  end


end
