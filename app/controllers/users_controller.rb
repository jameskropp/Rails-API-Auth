class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index, :update, :current]
  before_action :authorize,         only: [:update]
  
  def index
    render json: {status: 200, msg: 'Logged-in'}
  end
  
  def current
    current_user.update!(last_login: Time.now)
    render json: current_user
  end
  
  def create
    render json: User.new(user_params)
  end
  
  def update
    render json: User.find(params[:id].update!(user_params))
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
  
  def authorize
    return_unauthorized unless current_user && current_user.can_modify_user?(params[:id])
  end
end
