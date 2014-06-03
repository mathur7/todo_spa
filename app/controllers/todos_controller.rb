class TodosController < ApplicationController
  def index
    @todos = Todo.all
    respond_to do |f|
      f.html
      f.json { render :json => @todos, only: [:id, :title, :completed]}
    end
  end

  def new
    @todo = Todo.new
  end

  def create 	
  	@todo = Todo.create(todo_params)
  	respond_to do |f|
  		f.json { render :json => :todo, only: [:id, :title, :completed]}
  	end
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update todo_params
    respond_to do |f|
      f.json { render :json => :todo, only: [:id, :title, :completed]}
    end
  end

  def destroy
    Todo.find(params[:id]).destroy
    respond_to do |f|
      f.json { render :json => "deleted!"}
    end
    # redirect_to root_path
  end

  private
  def todo_params
    todo_params = params.require(:todo).permit(:id, :title, :completed)
  end

end
