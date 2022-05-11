$LOAD_PATH << './lib'
require 'require_all'

require_all 'lib'

menu = Menu.new
dishes = [
  Dish.new('Dish 1', 8.99),
  Dish.new('Dish 2', 1.99),
  Dish.new('Dish 3', 3.99)
]
dishes.map{|dish| menu.add_dish(dish)}
menu_formatter = MenuFormatter.new(menu)

user_selection = []
while true
  puts menu_formatter.format
  print 'Choose dish number or N for next step: '
  user_response = gets.chomp
  break if user_response.downcase == 'n'
  user_selection << CartItem.new(dishes[user_response.to_i - 1].name, dishes[user_response.to_i - 1].price)
end

cart = Cart.new
user_selection.map{|item| cart.add_item(item)}

cart_formatter = CartFormatter.new(cart)
puts cart_formatter.format


# unless submitted
# end