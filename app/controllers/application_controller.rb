class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :notfound 

  private

  def notfound(exception)
    logger.warn exception
    render file: 'public/404.html', status: :not_found, layout: false
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])  
  end 
  
end
