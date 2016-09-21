class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(title: params[:id])
    @trips = @category.trips
    render file: 'public/404' if @category.nil?
  end
end
