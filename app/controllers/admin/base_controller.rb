class Admin::BaseController < ApplicationController
  before_action :validate_admin

  def validate_admin
    render file: 'public/404' if current_user.nil? || current_user.user?
  end
end
