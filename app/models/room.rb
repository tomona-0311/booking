class Room < ApplicationRecord
  has_one_attached :image

  def self.room_serach(search)
   Room.where(['title LIKE ?', "%#{search}%"])
end

has_many :reservations
belongs_to :user,optional: true
end
