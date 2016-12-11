module PermissionsHelper
  # TODO: actually check if tokens are alive, etc
  def is_logged_in?
    session.key?(:user_credentials)
  end

  def is_administrator?
  end

  def is_participant?
  end

  def is_researcher?
  end
end