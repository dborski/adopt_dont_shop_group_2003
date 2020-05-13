require 'rails_helper'

describe "After a user adds a favorite pet" do
  it "displays a remove pet button instead of add favorite pet button" do

    pet1 = create(:pet)

    visit "/pets/#{pet1.id}" 

    within("#pet-#{pet1.id}") do
      click_button "Add Pet to Favorites"
    end

    expect(page).to have_button('Remove Pet from Favorites')
  end 
end 

describe "After a user clicks to remove pet from favorites" do
  it "deletes the pet from favorites" do

    pet1 = create(:pet)

    visit "/pets/#{pet1.id}" 

    within("#pet-#{pet1.id}") do
      click_button "Add Pet to Favorites"
    end
     
    within("#pet-#{pet1.id}") do
      click_button "Remove Pet from Favorites"
    end

    expect(page).to have_button('Add Pet to Favorites')
    expect(page).to have_content("Favorite Pets: 0")
  end 
end

describe "After a user adds a favorite pet and visits the favorites page" do
  describe "they click a link to remove the pet from favorites" do
    it "removes pet from favorites" do
      
      pet1 = create(:pet)

      visit "/pets/#{pet1.id}" 
      
      within("#pet-#{pet1.id}") do
        click_button "Add Pet to Favorites"
      end
    
      visit "/favorites/"

      within("#pet-#{pet1.id}") do
        click_button "Remove Pet from Favorites"
      end 

      visit "/favorites/"

      expect(page).to_not have_content(pet1.name)
      expect(page).to_not have_xpath("//img[@src = '#{pet1.img_url}' and @alt= '#{pet1.id}']")
      expect(page).to have_content("Favorite Pets: 0")
    end
  end
end

# User Story 13, Remove a Favorite from Favorites Page

# As a visitor
# When I have added pets to my favorites list
# And I visit my favorites page ("/favorites")
# Next to each pet, I see a button or link to remove that pet from my favorites
# When I click on that button or link to remove a favorite
# A delete request is sent to "/favorites/:pet_id"
# And I'm redirected back to the favorites page where I no longer see that
# pet listed
# And I also see that the favorites indicator has decremented by 1