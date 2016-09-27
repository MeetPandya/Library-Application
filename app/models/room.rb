class Room < ApplicationRecord
  validates :number, :location, :size  ,presence: true
  has_many :bookings
  has_many :bookinghistories
  has_many :users , through: :bookings
  has_many :users , through: :bookinghistories
end
