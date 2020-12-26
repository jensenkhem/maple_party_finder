module SessionsHelper
    def login(user)
        session[:user_id] = user.id
    end
    def current_user
        if session[:user_id]
            @current_user = @current_user || User.find_by(id: session[:user_id]) 
        end
    end
    def logged_in?
        if current_user.nil?
            return false
        else
            return true
        end
    end
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
