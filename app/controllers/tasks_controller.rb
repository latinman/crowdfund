class TasksController < ApplicationController
  before_action :find_task, except: [:index, :new, :create]
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks
    @to_do = current_user.tasks.where(state: "to_do")
    @doing = current_user.tasks.where(state: "doing")
    @done = current_user.tasks.where(state: "done")
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
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
    params.require(:task).permit(:content, :state)
  end
end