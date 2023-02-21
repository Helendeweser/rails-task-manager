class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def list
    @tasks = Task.all
  end

  def show
    set_task
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
    set_task
  end

  def update
    set_task
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    set_task
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
