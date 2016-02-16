class TasksController < ApplicationController
  before_action :find_task, except: [:index, :new, :create]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: "Successfully created task!"
    else
      redirect_to "new"
    end
  end

  def show
  end

 def edit
 end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: "Updated task!"
    else
      redirect_to "edit"
    end
  end

  def destroy
    if @task.destroy
      redirect_to tasks_path
    end
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:content)
  end
end