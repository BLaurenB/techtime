class Cart
  attr_reader :contents

  def initialize(cart_info)
    @contents = cart_info || {}
  end

  def total_count
    contents.values.sum
  end

  def count_of(id)
    contents[id.to_s] || 0
  end

  def add_freelancer(id)
    contents[id.to_s] = (contents[id.to_s] || 0) + 1
  end

  def freelancer_ids
    contents.keys
  end

  def total_price
    #get the prices associated with each item, multiply by quantity, sum it up

    #first instinct is to use map on the contents, but there has to be an activerecord way of grabbing the prices associated with each freelancer in the cart and then multiplying by the quantity.
    # pluck the prices of the freelance ids? then
  end
end
