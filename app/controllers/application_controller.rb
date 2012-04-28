class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  rescue_from ActiveRecord::DeleteRestrictionError do |exception|
  	redirect_to :back, :alert => exception.message
  end
end
