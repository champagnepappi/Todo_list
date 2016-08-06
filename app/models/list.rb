class List < ApplicationRecord
  enum status: {Public: 0, Private: 1}
  belongs_to :user
  has_many :cards
  has_many :todo_items, through: :cards
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence:true
end
