class Luser < ApplicationRecord
  has_secure_password
  has_many :bookings
  has_many :bookinghistories
  has_many :rooms ,through: :bookings ,through: :bookinghistories
end
