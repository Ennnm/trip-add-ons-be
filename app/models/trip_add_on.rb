class TripAddOn < ApplicationRecord
    belongs_to :trip
    belongs_to :add_on
end
