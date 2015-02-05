class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  around_filter :set_time_zone, if: :user_signed_in?

  def set_time_zone
    old = Time.zone
    Time.zone = current_user.time_zone if current_user.time_zone.present?
    yield
  ensure
    Time.zone = old
  end
end
