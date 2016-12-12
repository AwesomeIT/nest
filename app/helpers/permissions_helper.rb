module PermissionsHelper
  # TODO: actually check if tokens are alive, etc
  def is_logged_in?
    session.key?(:user_credentials)
  end

  def is_administrator?
    session[:user_credentials]["roleId"] == 1
  end

  def is_researcher?
    session[:user_credentials]["roleId"] == 2
  end

  def is_participant?
    session[:user_credentials]["roleId"] == 3
  end
end