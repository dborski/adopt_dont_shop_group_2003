require 'rails_helper'

describe "user sees any shelter" do
  describe "user can click the shelter name" do
    it "will be directed to shelter show page" do

      shelter1 = create(:shelter)
      shelter2 = create(:shelter)
      shelter3 = create(:shelter)

      pet1 = create(:pet, shelter_id:"#{shelter1.id}")
      pet2 = create(:pet, shelter_id:"#{shelter2.id}")


      visit "/shelters"

      within("#shelter-#{shelter1.id}") do
        expect(page).to have_link("#{shelter1.name}")
      end

      within("#shelter-#{shelter2.id}") do
        expect(page).to have_link("#{shelter2.name}")
      end

      within("#shelter-#{shelter3.id}") do
        expect(page).to have_link("#{shelter3.name}")
      end

      visit "/pets"

      within("#pet-#{pet1.id}") do
        expect(page).to have_link("#{shelter1.name}")
      end

      within("#pet-#{pet2.id}") do
        expect(page).to have_link("#{shelter2.name}")
      end

    end
  end
end
