class CharactersController < ApplicationController
  # We are going to use hidden fields in the form to pass along 
  # the current user's id to the character!! (This is a mental note)
  def new
    # Empty character to pass into form_for
    @character = Character.new
  end
  def create
    @character = current_user.characters.build(character_params)
    if @character.save
      # Handle a successful save
      flash[:success] = "Character has been created!"
      redirect_to characters_path
    else
      # Errors will be displayed in the form?
      render 'new'
    end
  end
  def view
  end
  def show
    @character = Character.find(params[:id])
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])
    if @character.update_attributes(character_params)
      flash[:success] = "Character updated successfully"
      redirect_to @character
    else
      render 'edit'
    end
  end

  def destroy
    Character.find(params[:id]).destroy
    flash[:success] = "Character deleted"
    redirect_to characters_path
  end

  private
    def character_params
      params.require(:character).permit(:name, :char_class, :user_id, :level, :stat)
    end
end
