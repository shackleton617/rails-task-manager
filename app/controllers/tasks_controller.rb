class TasksController < ApplicationController
   def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to home_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = tasks.find(params[:id])
    @task.destroy
    redirect_to home_path
  end


  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end

