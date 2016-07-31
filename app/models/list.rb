class List < ApplicationRecord
  belongs_to :user
  has_many :todo_items
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence:true
end
