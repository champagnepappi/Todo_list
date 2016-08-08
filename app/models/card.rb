class Card < ApplicationRecord
  belongs_to :list
  has_many :todo_items
end
