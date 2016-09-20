class Admin::TripsController < Admin::BaseController
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
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destory
  end

  private

  def trip_params
    params.require(:trip).permit(:title,
                                 :description,
                                 :price,
                                 :image,
                                 category_ids: [])
  end
end
