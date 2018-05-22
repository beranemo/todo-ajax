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
    
    redirect_to todos_path
  end
  
  def update
    @todo = Todo.find(params[:id])
    @todo.update_attributes(todo_params)
    
    redirect_to todos_path
  end
  
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    
    redirect_to todos_path
  end
  
  def toggle_check
    @todo = Todo.find(params[:id])
    @todo.toggle!(:done)

    redirect_to todos_path
  end
  
  private
  
  def todo_params
    params.require(:todo).permit(:title)
  end
  
end
