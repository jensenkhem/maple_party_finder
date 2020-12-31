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
    def get_current_user_chars
        if !current_user.nil?
            current_user.characters.map {|c| c.name}
        end
    end
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

    def store_location
        session[:forwarding_url] = request.original_url if request.get?
    end

    def redirect_back_or(default)
        redirect_to(session[:forwarding_url] || default)
        session.delete(:forwarding_url)
    end

end
