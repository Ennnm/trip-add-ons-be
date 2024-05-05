class AddOnsController < ApplicationController
  def index
    add_ons = AddOn.select { |addon| AddOn.isAvailable(addon.id) }
    render json: add_ons
  end
end
