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
  puts
  puts 'MENU'
  puts '----'
  puts menu_formatter.format
  puts
  print 'Choose dish number or N for next step: '
  user_response = gets.chomp
  break if user_response.downcase == 'n'
  user_selection << CartItem.new(dishes[user_response.to_i - 1].name, dishes[user_response.to_i - 1].price)
end

cart = Cart.new
user_selection.map{|item| cart.add_item(item)}

cart_formatter = CartFormatter.new(cart)
puts 'Your cart contents:'
puts cart_formatter.format
puts
puts 'Please enter your details:'
puts '--------------------------'
print 'What is your name? '
full_name = gets.chomp
print 'Where do you live? '
address = gets.chomp
print 'What is your mobile number? '
mobile = gets.chomp
customer = Customer.new(full_name, address, mobile)
order = Order.new(customer, cart)
order_formatter = OrderFormatter.new(order)

puts cart_formatter.format

puts
puts 'Your cart contents:'
puts '-------------------'
print 'Please confirm your order (y/n): '
confirm_order = gets.chomp

if confirm_order.downcase == 'y'
  order.submit
  puts
  puts 'Your order details:'
  puts '-------------------'
  puts order_formatter.format
  delivery_text_formatter = DeliveryTextFormatter.new(order)
  text_sender = TextSender.new(delivery_text_formatter.format, customer.mobile)
  text_sender.send
else
  puts 'Order cancelled!'
  puts 'Thank you!'
end