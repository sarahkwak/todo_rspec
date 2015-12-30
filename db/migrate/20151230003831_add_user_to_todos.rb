class AddUserToTodos < ActiveRecord::Migration
  def change
    add_reference :todos, :user, foreign_key: true
  end
end
