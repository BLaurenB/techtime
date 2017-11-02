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

  it '#delete_freelancer' do
    cart.delete_freelancer(1)
    expect(cart.contents).to eq({"2" => 4})
  end

  it '#freelancer_ids' do
    expect(cart.freelancer_ids).to eq(["1", "2"])
  end

  it '#collect_freelancers' do
    #factory_bot should do it if we set it up in the factory
    create_list(:freelancer, 2)
    expect(cart.collect_freelancers.first).to be_an_instance_of(Freelancer)
  end

  it '#subtotal' do
    freelancer = create(:freelancer, price:10)
    expect(cart.subtotal(freelancer)).to eq(20)
  end

  it '#total_price' do
    create_list(:freelancer, 2, price: 10)
    expect(cart.total_price).to eq(60)
  end
end
