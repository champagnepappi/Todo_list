class TodoItem < ApplicationRecord
  belongs_to :user
  belongs_to :list
  validates :content, presence: :true
  def completed?
    !completed_at.nil?
  end
  def unmark?
    completed_at.nil?
  end
end
