require 'rails_helper'

describe Order do

  describe "relationships" do
    it "belongs to user" do
      order = build(:order)

      expect(order).to respond_to(:user)
    end
    it "has many freelancers" do
      order = build(:order)

      expect(order).to respond_to(:freelancers)
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

  describe "class methods" do
    before do
      order_1 = create(:order)
      order_2 = create(:order, status: 1)
      order_3 = create(:order, status: 2)
      order_4 = create(:order, status: 3)
    end

    it ".total_ordered" do
      expect(Order.total_ordered).to eq(1)
    end

    it ".total_paid" do
      expect(Order.total_paid).to eq(1)
    end

    it ".total_cancelled" do
      expect(Order.total_cancelled).to eq(1)
    end

    it ".total_completed" do
      expect(Order.total_completed).to eq(1)
    end

  end
end
