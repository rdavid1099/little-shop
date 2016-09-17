class BaseController < ApplicationController
  before_action :validate_user

  def validate_user
    render file: 'public/404' if current_user.nil? || current_user.admin?
  end
end
