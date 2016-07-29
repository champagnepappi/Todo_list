class CreateTodoItems < ActiveRecord::Migration[5.0]
  def change
    create_table :todo_items do |t|
      t.string :content
      t.references :list, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
