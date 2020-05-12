class FavoritesController < ApplicationController
  include ActionView::Helpers::TextHelper
    
  def update
    pet = Pet.find(params[:pet_id])
    favorite.add_pet(pet.id)
    session[:favorite] = favorite.contents
    flash[:notice] = "#{pet.name} has been added to your favorites."   

    redirect_to "/pets/#{pet.id}"
  end
end