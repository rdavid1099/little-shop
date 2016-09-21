class Admin::TripsController < Admin::BaseController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new
    if @trip.create_trip_with_category(trip_params)
      redirect_to admin_trip_path(Trip.last)
    else
      flash.now['alert-danger'] = 'Trip did not save'
      render :new
    end
  end

  def index
    @trips = Trip.all
  end

  def show
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to admin_trip_path(@trip)
    else
      flash.now['alert-danger'] = 'Trip did not save'
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to admin_trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:title,
                                 :description,
                                 :price,
                                 :image,
                                 category_ids: [])
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
