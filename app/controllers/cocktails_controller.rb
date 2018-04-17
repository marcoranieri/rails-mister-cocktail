class CocktailsController < ApplicationController

  before_action :find_id, only: [ :destroy, :show ]

  def index
# Search a specific cocktail passing params "q" through "name" key in search bar
    if params.has_key?(:q)
# search in SQL if found name containing anywhere(%) the value of research
      @cocktails = Cocktail.where('name LIKE ?', "%#{params[:q]}%")
    else
      @cocktails = Cocktail.all
    end

  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
# if saved redirect, else render again the form in "new" page
    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end

  end

  def destroy
# display the name of the deleted element in index
    flash[:notice] = "Your #{@cocktail.name} has been deleted"
    @cocktail.destroy

    redirect_to cocktails_path
  end

  private

  def cocktail_params
   params.require(:cocktail).permit(:name, :photo, :photo_cache)
  end

   def find_id
    @cocktail = Cocktail.find(params[:id])
  end

end
