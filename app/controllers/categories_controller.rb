class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(title: params[:id])
    if @category.nil?
      render file: 'public/404'
    else
      @trips = @category.trips
    end
  end
end
