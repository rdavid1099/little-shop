class BaseController < ApplicationController
  before_action :validate_user

  def validate_user
    render file: 'public/404' unless current_user
  end
end
