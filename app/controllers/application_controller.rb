class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
    def require_admin
      unless current_user.is_admin?
        redirect_to dashboard_url, alert: t('alerts.you_dont_have_permission_to_access_this_feature')
      end
    end
end
