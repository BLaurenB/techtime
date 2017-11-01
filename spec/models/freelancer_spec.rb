require 'rails_helper'

describe Freelancer do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
  end

  describe "relationships" do
    it "belongs to category" do
      freelancer = build(:freelancer)
      expect(freelancer).to respond_to(:category)
    end
  end
end
