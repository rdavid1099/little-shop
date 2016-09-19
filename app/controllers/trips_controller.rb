class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def dashboard
    @top_sellers = Trip.get_top_sellers
  end
end
