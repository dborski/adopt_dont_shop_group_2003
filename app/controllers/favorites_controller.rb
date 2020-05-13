class FavoritesController < ApplicationController
  include ActionView::Helpers::TextHelper
  
  def index
    pet_ids = favorite.contents.keys
    @pets = Pet.find(pet_ids)
  end

  def update
    pet = Pet.find(params[:pet_id])
    favorite.add_pet(pet.id)
    session[:favorite] = favorite.contents
    flash[:notice] = "#{pet.name} has been added to your favorites."   

    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    pet = Pet.find(params[:pet_id])
    favorite.contents.delete(pet.id.to_s)
    flash[:notice] = "#{pet.name} has been removed from your favorites."   

    redirect_to "/pets/#{pet.id}"
  end
  
end