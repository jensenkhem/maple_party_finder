module GroupsHelper
    def user_in_party?
        user_names = current_user.characters.map{|c| c.name}
        group_names = @group.characters.map{|c| c.name}
        user_names.each do |char|
            if group_names.include? char
                return true
            end
        end
        return false
    end

    def get_party_chars_except_user
        user_names = current_user.characters.map{|c| c.name}
        group_names = @group.characters.map{|c| c.name}
        filtered_list = group_names - user_names
        return filtered_list
    end

    def user_has_parties?
        current_user.characters.each do |char|
            if char.groups.size > 0
                return true
            end
        end
        return false
    end


end
