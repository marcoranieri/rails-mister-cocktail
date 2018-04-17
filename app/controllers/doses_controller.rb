class DosesController < ApplicationController
# cocktails <----> doses <----> ingredient
  def new
    @dose = Dose.new
# we need also the instance related to this dose to refer to it
    @cocktail = Cocktail.find(params[:cocktail_id])

        @ingredient = Ingredient.new

  end

  def create
# find the relational cocktail with params:id coming from dose itself (foreign key)
    @cocktail = Cocktail.find(params[:cocktail_id])
# find the relational ingredient with ingredient:id coming from ingredient object in .dose (foreign key)
    @ingredient = Ingredient.find(params["dose"]["ingredient_id"])

    @dose = Dose.new(dose_params)
# we create the relation between models
    @dose.cocktail = @cocktail

#/// - - - - WE CREATE THE RELATION - - - - - \\\#
    @dose.cocktail = @cocktail

    if @dose.save
# redirect if saved, render again form in "new" view if not
      redirect_to @cocktail # itself (we already stored the cockt object that we are related to)
    else
      render :new
    end

  end

  def destroy
    @dose = Dose.find(params[:cocktail_id])
    @cocktail = @dose.cocktail

    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

private

  def dose_params
# IMPORTANT permit :INGREDIENT_ID from dose PARAMS
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
