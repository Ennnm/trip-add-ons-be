require "rails_helper"

RSpec.describe "AddOns", type: :request do
  describe "GET /add_ons" do
    it "returns a success response" do
      get "/add_ons"
      expect(response).to be_successful
    end

    it "returns a success response, return 2 add ons" do
      FactoryBot.create(:add_on)
      FactoryBot.create(:add_on)
      get "/add_ons"
      expect(response).to be_successful
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(2)
    end
  end
end
