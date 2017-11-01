require 'rails_helper'

describe Cart do
  let(:cart) { Cart.new({"1" => 2, "2" => 4})}

  it '#total_count' do
    expect(cart.total_count).to eq(6)
  end

  it '#count_of' do
    expect(cart.count_of(1)).to eq(2)
    expect(cart.count_of(-2)).to eq(0)
  end

  it '#add_freelancer' do
    cart.add_freelancer(1)
    cart.add_freelancer(2)
    expect(cart.contents).to eq({"1" => 3, "2" => 5})
  end
end
