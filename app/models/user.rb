class User < ApplicationRecord
  has_secure_password
  has_many :bookings
  has_many :bookinghistories
  has_many :rooms ,through: :bookings
  has_many :rooms ,through: :bookinghistories
end
