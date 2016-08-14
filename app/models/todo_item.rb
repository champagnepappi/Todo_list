class TodoItem < ApplicationRecord
  belongs_to :card

  def completed?
    !completed_at.nil?
  end
  def unmark?
    completed_at.nil?
  end
end
