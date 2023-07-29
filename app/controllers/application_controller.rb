class ApplicationController < ActionController::Base
  def current_user
    @current_user || find_user_by_session_id(session[:user_id])
  end


  def current_user_admin?
    current_user and current_user.admin?
  end
  
  def require_signin
    unless current_user
      session[:intended_url] = request.url
      redirect_to new_session_path, alert: "Please signin to continue"
    end
  end

  def require_admin
    unless current_user and current_user.admin?
      redirect_to (current_user or root_path), alert: "Not authorized to perform this operation"
    end
  end

  def current_user?(user)
    current_user == user or current_user_admin?
  end
  
  helper_method :current_user_admin?
  helper_method :current_user
  helper_method :current_user?
  private 
    def find_user_by_session_id(id)
      if session[:user_id]
        user ||= Client.find_by(email: id) or Maid.find_by(email: id) or Admin.find_by(email: id)
      end
    end
end
