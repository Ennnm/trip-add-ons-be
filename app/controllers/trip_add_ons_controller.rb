class TripAddOnsController < ApplicationController
  # to avoid CSRF token check
  skip_before_action :verify_authenticity_token, :only => [:create]
  before_action :set_trip
  def create
    add_on_ids = params[:add_on_ids]
    if AddOn.has_conflicting_times(add_on_ids)
      render json: { status: "error", message: "has conflicting times" }
      return
    end
    if !AddOn.areAvailable(add_on_ids)
      render json: { status: "error", message: "has unavailable add ons" }
      return
    end
    add_on_ids.each do |add_on_id|
      add_on = AddOn.find_by(id: add_on_id)
      @trip.add_ons << add_on if add_on.present?
    end
    render json: { status: "success", message: "Add-ons were successfully added to the trip.", data: @trip.add_ons}
  end

  private

  def set_trip
    # @trip = Trip.find(params[:trip_id])
    # assume that the add ons are added to the only trip in the db
    @trip = Trip.first()
  end
end
