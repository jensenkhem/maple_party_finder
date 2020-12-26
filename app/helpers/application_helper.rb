module ApplicationHelper
    def active_state(link_path)
        current_page?(link_path) ? "active" : ""
    end
    def login_display
        if logged_in?
            link_to "Logout", logout_path, method: :delete
        else
            link_to "Login", login_path
        end
    end
end
