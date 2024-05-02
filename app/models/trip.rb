class Trip < ApplicationRecord
  has_many :trip_add_ons
  has_many :add_ons, through: :trip_add_ons
end
