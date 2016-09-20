class Admin::TripsController < Admin::BaseController
  def new
    @trip = Trip.new
  end

  def create
    if @trip.create(trip_params)

    else

    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destory
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :description, :price, :category_ids, :trip_image)
  end
end
