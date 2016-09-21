class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find_by(id: params[:id])
    render file: 'public/404' if @trip.nil?
  end

  def dashboard
    @top_sellers = Trip.get_top_sellers
  end
end
