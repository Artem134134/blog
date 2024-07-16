module ApplicationHelper

  def bootstrap_alert_class(type)
    {
      notice: 'info',
      info: 'info',
      success: 'success',
      warning: 'warning',
      error: 'danger',
      alert: 'danger'
    }.fetch(type.to_sym, type.to_s)
  end
  
end
