class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :contents

      t.timestamps null: false
    end
  end
end
