
# Basic Objectives:
# user chooses 1 item from a list of main dishes
# user chooses 2 side dish items
# computer repeats users order 
# computer then totals lunch items and displays 
# total dollar amount.

# Bonus Objectives:
# user can choose as many "addon"
# items as they want before getting total
# user can clear their choices and start over
# user has a wallet total they start with and 
# their choices cannot exceed the amount of change
# in the user's pocket.

class LunchLady

  MAIN_DISHES = [
    {name: "Hamburger", price: 1.25},
    {name: "Cheeseburger", price: 1.35},
    {name: "Fish Sandwich", price: 1.45},
    {name: "Chicken Nuggets", price: 1.35}
  ]

  SIDE_DISHES = [
    {name: "Soda", price: 0.65},
    {name: "Apple Slices", price: 0.75},
    {name: "Fries", price: 0.95},
    {name: "Cheese Sticks", price: 0.95},
    {name: "Milk Shake", price: 0.65},
    {name: "Brownie", price: 0.75}
  ]

  attr_accessor :order

  def initialize
    self.order = Order.new
  end

  def start
    puts "\n"*5
    puts 'Welcome to the Lunch Lady Burger Emporium'
    puts 'May I take your order? Please choose one (1) item '\
         'from Main Dish Menu'
    puts "-"*25
    display_main_dishes
    puts "-"*25
    
    while true
      main_item_number = STDIN.gets.chop!
      if (1..MAIN_DISHES.length).include?(main_item_number.to_i)
        break
      end
      puts "Invalid option... please try again"
    end

    order.add(MAIN_DISHES[main_item_number.to_i - 1])

    puts "Please choose a Side Dish"
    puts "-"*25
    display_side_dishes
    puts "-"*25

    while true
      side_item_number = STDIN.gets.chop!
      if (1..SIDE_DISHES.length).include?(main_item_number.to_i)
        break
      end
      puts "Invalid option... please try again"
    end

    order.add(SIDE_DISHES[side_item_number.to_i - 1])

    puts "Please choose another Side Dish"
    puts "-"*25
    display_side_dishes
    puts "-"*25

    while true
      side_item_number = STDIN.gets.chop!
      if (1..SIDE_DISHES.length).include?(main_item_number.to_i)
        break
      end
      puts "Invalid option... please try again"
    end

    order.add(SIDE_DISHES[side_item_number.to_i - 1])

    order.total
  end

  def display_main_dishes
    MAIN_DISHES.each_with_index do |item, index|
      puts "[#{index+1}] #{item[:name]} - $#{item[:price]}"
    end
  end

  def display_side_dishes
    SIDE_DISHES.each_with_index do |item, index|
      puts "[#{index+1}] #{item[:name]} - $#{item[:price]}"
    end
  end

end


class Order
  #add item remove item clear order total order
  attr_accessor :items, :total
  attr_accessor :order_total

  def initialize
    self.items = []
    self.order_total = 0.0
  end

  def add(item)
    items.push(item)
    #order_total = order_total + item[:price]
  end

  def clear
    items.clear
  end

  def total
    items.each do |item|
      self.order_total = self.order_total + item[:price]
    end
    puts "Your order total is: $#{order_total}"
  end

end

lunch_lady = LunchLady.new
lunch_lady.start

#order = Order.new


# print "Welcome to the Lunch Lady Burger Emporium
# May I take your order? Please choose one (1) item 
# from Main Dish Menu and two (2) items from the Side 
# Dish Menu?"

# Print "Main Dish Menu"

# 1. Hamburger $1.25
# 2. Cheeseburger $1.35
# 3. Fish Sandwich $1.45
# 4. Chicken Nuggets $1.35


# Print "Side Dish Menu" 

# 1. Soda $.65 
# 2. Apple Slices $.75
# 3. Fries $.95
# 4. Cheese Sticks $.95
# 5. Milk Shake $.65
# 6. Brownie $.75

# Order Complete 

# Order Total

# Done with this order.


