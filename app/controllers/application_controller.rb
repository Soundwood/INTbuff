class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    
    private

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end
    
    def require_logged_in
        redirect_to controller: 'sessions', action: 'new' unless current_user
    end

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to login_path if !logged_in?
    end
end
