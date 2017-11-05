require 'rails_helper'

describe Order do

  describe "relationships" do
    it "belongs to user" do
      order = build(:order)

      expect(order).to respond_to(:user)
    end
  end

  describe "order status" do
    it "should default to active" do
      order = build(:order)

      expect(order.status).to eq("Ordered")
      expect(order.Ordered?).to be_truthy
    end

    it "can be paid" do
      order = build(:order, status: 1)

      expect(order.status).to eq("Paid")
      expect(order.Paid?).to be_truthy
    end

    it "can be cancelled" do
      order = build(:order, status: 2)

      expect(order.status).to eq("Cancelled")
      expect(order.Cancelled?).to be_truthy
    end

    it "can be completed" do
      order = build(:order, status: 3)

      expect(order.status).to eq("Completed")
      expect(order.Completed?).to be_truthy
    end
  end
end
