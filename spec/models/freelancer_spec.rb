require 'rails_helper'

describe Freelancer do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
  end

  describe "freelancer status" do
    it "should default to active"do
      freelancer = build(:freelancer)

      expect(freelancer.status).to eq("active")
      expect(freelancer.active?).to be_truthy
    end

    it "can be retired" do
      freelancer = build(:freelancer, status: 1)

      expect(freelancer.status).to eq("retired")
      expect(freelancer.active?).to be_falsey
      expect(freelancer.retired?).to be_truthy
    end
  end


  describe "relationships" do
    it "belongs to category" do
      freelancer = build(:freelancer)
      expect(freelancer).to respond_to(:category)
    end
  end
end
