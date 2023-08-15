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
    task = Task.new(res_params)
    task.save
    redirect_to task_path(task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(res_params)

   redirect_to task_path(task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end
  private

  def res_params
    params.require(:task).permit(:title, :details)
  end
end
