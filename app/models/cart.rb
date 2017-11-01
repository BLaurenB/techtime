class Cart
  attr_reader :contents

  def initialize(cart_info)
    @contents = cart_info
  end

  def total_count
    contents.values.sum
  end

end
