class CreateTodoItems < ActiveRecord::Migration[5.0]
  def change
    create_table :todo_items do |t|
      t.text :content
      t.references :card, foreign_key: true

      t.timestamps
    end
  end
end
