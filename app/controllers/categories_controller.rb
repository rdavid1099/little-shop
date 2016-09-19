class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(title: params[:id])
    @trips = @category.trips
  end
end
