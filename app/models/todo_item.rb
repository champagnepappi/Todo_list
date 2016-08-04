class TodoItem < ApplicationRecord
  belongs_to :list
  belongs_to :user
  validates :content, presence: :true
  def completed?
    !completed_at.nil?
  end
  def unmark?
    completed_at.nil?
  end
end
