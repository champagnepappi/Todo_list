class TodoItem < ApplicationRecord
  belongs_to :card
  validates :content, presence: :true
  def completed?
    !completed_at.nil?
  end
  def unmark?
    completed_at.nil?
  end
end
