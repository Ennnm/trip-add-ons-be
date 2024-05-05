require "rails_helper"

RSpec.describe "TripAddOns", type: :request do
  describe "POST /trip_add_ons" do
    it "returns a success response" do
      trip = FactoryBot.create(:trip)
      add_on1 = FactoryBot.create(:add_on, custom_start_time: Time.now, custom_end_time: Time.now + 1.hour, custom_total_spots: 10)
      add_on2 = FactoryBot.create(:add_on, custom_start_time: Time.now + 1.hour, custom_end_time: Time.now + 3.hour, custom_total_spots: 10)
      add_on_ids = [add_on1, add_on2].pluck(:id)
      post "/trip_add_ons", params: { trip_id: trip.id, add_on_ids: add_on_ids }
      expect(response).to be_successful
      expect(TripAddOn.where(trip_id: trip.id, add_on_id: add_on_ids)).to exist
    end
    it "has time conflict, returns an error response" do
      trip = FactoryBot.create(:trip)
      add_on1 = FactoryBot.create(:add_on, custom_start_time: Time.now, custom_end_time: Time.now + 1.hour, custom_total_spots: 10)
      add_on2 = FactoryBot.create(:add_on, custom_start_time: Time.now, custom_end_time: Time.now + 3.hour, custom_total_spots: 10)
      add_on_ids = [add_on1, add_on2].pluck(:id)
      post "/trip_add_ons", params: { trip_id: trip.id, add_on_ids: add_on_ids }
      expect(response).to be_successful
      expect(JSON.parse(response.body)).to eq({
                                             "status" => "error",
                                             "message" => "has conflicting times",
                                           })
    end
    it "have no availability, returns an error response" do
      trip = FactoryBot.create(:trip)
      add_on1 = FactoryBot.create(:add_on, custom_start_time: Time.now, custom_end_time: Time.now + 1.hour, custom_total_spots: 1)
      add_on2 = FactoryBot.create(:add_on, custom_start_time: Time.now + 1.hour, custom_end_time: Time.now + 3.hour, custom_total_spots: 1)
      FactoryBot.create(:trip_add_on, add_on: add_on1)
      add_on_ids = [add_on1, add_on2].pluck(:id)
      post "/trip_add_ons", params: { trip_id: trip.id, add_on_ids: add_on_ids }
      expect(response).to be_successful
      expect(JSON.parse(response.body)).to eq({
                                             "status" => "error",
                                             "message" => "has unavailable add ons",
                                           })
    end
  end
end
