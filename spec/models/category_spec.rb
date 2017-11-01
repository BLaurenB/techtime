require 'rails_helper'

describe Category do
  describe "validations" do
      it { should validate_presence_of(:title) }
  end

  describe "relationships" do
    it "has many freelancers" do
    category = build(:category)

    expect(category).to respond_to(:freelancers)
    end
  end
end
