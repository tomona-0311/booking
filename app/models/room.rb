class Room < ApplicationRecord
  has_one_attached :image

has_many :reservations
belong_to :user
end
