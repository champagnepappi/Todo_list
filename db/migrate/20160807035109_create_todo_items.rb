class CreateTodoItems < ActiveRecord::Migration[5.0]
  def change
    create_table :todo_items do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :list, foreign_key: true
      t.references :card, foreign_key: true
      t.boolean :status, default: 0

      t.timestamps
    end
  end
end
