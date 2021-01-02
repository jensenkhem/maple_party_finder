class GroupsController < ApplicationController
    before_action :authenticate
    def new
        @group = Group.new
        if current_user.characters.size == 0
            flash[:danger] = "You need at least one character to create a party!"
            redirect_to makechar_path
        end
    end

    def create
        @group = Group.new(group_params)
        if(@group.save)
            group_char = Character.find_by name: params[:group][:creator]
            @group.characters << group_char
            flash[:success] = "Party successfully created!"
            redirect_to @group
        else
            render 'new'
        end
    end

    def show
        @group = Group.find(params[:id])
        @char_list = get_current_user_chars
    end

    def edit
        @group = Group.find_by id: params[:id]
        char_list = get_current_user_chars
        if !char_list.include? @group.creator
            redirect_to @group
        end
    end

    def index
        if params[:boss_filter].present?
            @groups = Group.filter_by_boss(params[:boss_filter]).paginate(page: params[:page])
        else
            @groups = Group.all.paginate(page: params[:page])
        end
    end

    def remove
        @group = Group.find_by id: params[:id] 
        char = Character.find_by name: params[:group][:selected_char]
        @group.characters.delete(char)
        flash[:success] = char.name +  " has been removed from the party!"
        redirect_to @group
    end

    def join
        @group = Group.find_by id: params[:id]
        char_to_join = Character.find_by name: params[:group][:selected_char]
        if @group.characters.size < 6
            @group.characters << char_to_join
            flash[:success] = "Joined the party!"
            redirect_to @group
        else
            flash[:danger] = "Party is full!"
            redirect_to @group
        end
    end

    def update
        @group = Group.find_by id: params[:id]
        if @group.update_attributes(group_params)
            flash[:success] = "Party updated successfully!"
            redirect_to @group
        else
            render 'edit'
        end
    end

    private
        def group_params
            params.require(:group).permit(:name, :creator, :boss)
        end
end
