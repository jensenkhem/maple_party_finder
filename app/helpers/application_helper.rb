module ApplicationHelper
    def active_state(link_path)
        current_page?(link_path) ? "active" : ""
    end
end
