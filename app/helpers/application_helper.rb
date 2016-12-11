# frozen_string_literal: true
module ApplicationHelper
  include PermissionsHelper

  def bootstrap_alert_class(type)
    { success: 'alert-success',
      error: 'alert-danger', 
      alert: 'alert-warning', 
      notice: 'alert-info' }.with_indifferent_access.fetch(type, '')
  end
end
