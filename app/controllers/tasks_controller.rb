class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.rank(:row_order).all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)

    respond_to do |format|
      if @task.save
        format.html do
          redirect_to '/'
        end
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @task.errors.full_messages, status: :unprocessable_entity }
      end
      
    end
  end

  def edit
  end

  def update
     respond_to do |format|
      if @task.update(task_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @task.errors.full_messages, status: :unprocessable_entity }
      end
     
    end
  end


  def destroy
    @task.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def update_row_order
    @task = Task.find(params[:id])
    @task.row_order_position = params[:row_order]
    @task.save

    render nothing: true
  end

  def update_status
    @task = Task.find(params[:id])
    @task.completed = !params[:completed].to_bool
    
    respond_to do |format|
      if @task.save
        @task.reload
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @task.errors.full_messages, status: :unprocessable_entity }
      end
     
    end
  end


private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:name, :attachment, :completed, :tag_ids => [])
  end
end
