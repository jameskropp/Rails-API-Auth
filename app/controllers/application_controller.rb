class ApplicationController < ActionController::API
  include Knock::Authenticable
  
  def return_unauthorized
    render status: :unauthorized
  end
  
  protected
  
  def authorize_as_admin
    return_unauthorized unless !current_user.nil? && current_user.is_admin?
  end
end
