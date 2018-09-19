class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

protected
  def authenticate_admin!
    if admin_signed_in?
      super
    else
      render '/admin/denied'
    end
  end
end
