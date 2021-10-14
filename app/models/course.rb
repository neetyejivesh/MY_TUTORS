class Course < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :user, through: :bookings
end
