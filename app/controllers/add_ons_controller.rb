class AddOnsController < ApplicationController
  def index
    add_ons = AddOn.all
    render json: add_ons
  end
end
