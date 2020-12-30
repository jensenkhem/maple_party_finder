class GroupsController < ApplicationController
    before_action :authenticate
    def new
        @group = Group.new
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
    end

    private
        def group_params
            params.require(:group).permit(:name, :creator, :boss)
        end
end
