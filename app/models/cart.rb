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

end
