class TodosController < ApplicationController
  def index
    @todos = Todo.where(user_id: current_user)
    @todo = Todo.new
  end

  def create
    @todo = Todo.create(contents: params[:todo][:contents], user_id: current_user.id)
    redirect_to :root
  end 

  def new
    @todo = Todo.new
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update(contents: params[:todo][:contents])
    # @todo.save!
    redirect_to :root
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    redirect_to :root
  end

end
