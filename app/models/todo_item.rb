class TodoItem < ApplicationRecord
  belongs_to :list
  belongs_to :user
  def completed?
    !completed_at.nil?
  end
end
