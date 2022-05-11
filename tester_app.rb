$LOAD_PATH << './lib'
require 'require_all'

require_all 'lib'

menu = Menu.new
dishes = [
  Dish.new('Dish 1', 8.99),
  Dish.new('Dish 2', 1.99),
  Dish.new('Dish 3', 3.99)
]

menu.add_dish(dish_1)
menu.add_dish(dish_2)
menu.add_dish(dish_3)

menu_formatter = MenuFormatter.new(menu)
puts menu_formatter.format