class AddOn < ApplicationRecord
  has_many :trip_add_ons
  has_many :trips, through: :trip_add_ons

  def self.has_conflicting_times(add_on_ids)
    conflicting_add_ons = AddOn.select("1")
      .where(id: add_on_ids)
      .where.not(start_time: nil, end_time: nil)
      .joins("INNER JOIN add_ons AS a2 ON a2.id IN (#{add_on_ids.join(",")})")
      .where("a2.id != add_ons.id")
      .where("(add_ons.start_time BETWEEN a2.start_time AND a2.end_time) OR (add_ons.end_time BETWEEN a2.start_time AND a2.end_time)")
      .exists?
    conflicting_add_ons
  end

  # check availability
  def self.number_of_remaining_spots(id)
    count = TripAddOn.where(add_on_id: id)
      .count
    total_avail = AddOn.where(id: id).first.total_spots
    total_avail - count
  end

  def self.isAvailable(id, spots_to_take = 1)
    self.number_of_remaining_spots(id) >= spots_to_take
  end

  def self.areAvailable(ids)
    ids.each do |id|
      if !self.isAvailable(id)
        return false
      end
    end
    true
  end
end
