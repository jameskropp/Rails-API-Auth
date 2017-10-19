class ApplicationController < ActionController::API
  # Include Knock within your application.
  include Knock::Authenticable
  
  def return_unauthorized
    render status: :unauthorized
  end
  
  protected
  
  # Method for checking if current_user is admin or not.
  def authorize_as_admin
    return_unauthorized unless !current_user.nil? && current_user.is_admin?
  end
end
