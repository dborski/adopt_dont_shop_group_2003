require 'rails_helper'

describe Application, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :description}
  end

  describe "relationships" do
      it { should have_many :pet_applications}
      it { should have_many(:pets).through(:pet_applications)}
  end

end
