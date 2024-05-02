require "rails_helper"

RSpec.describe AddOn, type: :model do
  # conflicting times
  describe "does not have conflicting times" do
    it "returns false if there are no conflicting times" do
      add_on1 = FactoryBot.create(:add_on, custom_start_time: Time.now, custom_end_time: Time.now + 1.hour, custom_total_spots: 10)
      add_on2 = FactoryBot.create(:add_on, custom_start_time: Time.now + 1.hour, custom_end_time: Time.now + 3.hour, custom_total_spots: 10)

      expect(AddOn.has_conflicting_times([add_on1.id, add_on2.id])).to be_falsey
    end
  end
  describe "does not have conflicting times with nil" do
    it "returns false if there are no conflicting times" do
      add_on1 = FactoryBot.create(:add_on, custom_total_spots: 10)
      add_on2 = FactoryBot.create(:add_on, custom_total_spots: 10)

      expect(AddOn.has_conflicting_times([add_on1.id, add_on2.id])).to be_falsey
    end
  end
  describe "have conflicting times" do
    it "returns true if there are conflicting times" do
      add_on1 = FactoryBot.create(:add_on, custom_start_time: Time.now, custom_end_time: Time.now + 2.hour, custom_total_spots: 10)
      add_on2 = FactoryBot.create(:add_on, custom_start_time: Time.now + 1.hour, custom_end_time: Time.now + 3.hour, custom_total_spots: 10)

      expect(AddOn.has_conflicting_times([add_on1.id, add_on2.id])).to be_truthy
    end
  end
  # available spots
  describe "have available spots" do
    it "returns 9" do
      add_on1 = FactoryBot.create(:add_on, custom_start_time: Time.now, custom_end_time: Time.now + 2.hour, custom_total_spots: 10)
      FactoryBot.create(:trip_add_on, add_on: add_on1)
      expect(AddOn.number_of_remaining_spots(add_on1.id)).to eq(9)
    end
  end
  describe "have no available spots" do
    it "returns 0" do
      add_on1 = FactoryBot.create(:add_on, custom_start_time: Time.now, custom_end_time: Time.now + 2.hour, custom_total_spots: 1)
      FactoryBot.create(:trip_add_on, add_on: add_on1)
      expect(AddOn.number_of_remaining_spots(add_on1.id)).to eq(0)
    end
  end
end
