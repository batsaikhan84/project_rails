class ApplicationController < ActionController::Base
    add_flash_types :alert

    protect_from_forgery with: :exception
    helper_method :current_user
    before_action :user_verified
    
    def user_verified
        redirect_to root_path, alert: 'Please log in' unless logged_in
    end
    
    def logged_in
        !!current_user
    end
    
    def current_user
        current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
end


