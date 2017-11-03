require 'rails_helper'

describe Order do

  describe "relationships" do
    it "belongs to user" do
      order = build(:order)

      expect(order).to respond_to(:user)
    end
  end
end
