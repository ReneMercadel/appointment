class Room < ApplicationRecord
  validates :name, :capacity, presence: true
end
