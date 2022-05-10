class CartFormatter
  def initialize(cart) # cart is an instance of Cart
    @cart = cart
  end

  def format
    @cart.get_items.map.with_index{|item, i| "#{i+1}. #{item.name}: £#{item.price}"}.join('\n')
  end
end