class List < ApplicationRecord
  belongs_to :user
  has_many :cards
  validates :user_id, presence: true
  validates :title, presence: true
end
