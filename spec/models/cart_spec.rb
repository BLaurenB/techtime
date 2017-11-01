require 'rails_helper'

describe Cart do
  let(:cart) { Cart.new({"1" => 2, "2" => 4})}

  it '#total_count' do
    expect(cart.total_count).to eq(6)
  end
end
