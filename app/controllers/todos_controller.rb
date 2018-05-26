class TodosController < ApplicationController
  
  def index
    @todos = Todo.all
    
    if params[:x]
      @todo = Todo.find(params[:x])
    else
      @todo = Todo.new
    end
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save
    
    render json: { id: @todo.id, title: @todo.title }
  end
  
  def edit
    @todo = Todo.find(params[:id])
    
    render json: { id: @todo.id, title: @todo.title }
  end
  
  def update
    @todo = Todo.find(params[:id])
    @todo.update_attributes(todo_params)
    render json: { id: @todo.id, title: @todo.title }
  end
  
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    render json: { id: @todo.id }
  end
  
  def toggle_check
    @todo = Todo.find(params[:id])
    @todo.toggle!(:done)
  end
  
  private
  
  def todo_params
    params.require(:todo).permit(:title)
  end
  
end
