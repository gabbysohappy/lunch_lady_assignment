# Please go to https://github.com/gabbysohappy/lunch_lady_assignment to see the repository

require 'colorize'

@customers_trays = []

@main_dishes = [ 
    { name: 'Meatloaf', description: 'Ground beef shaped into a loaf. Doesn\'t look like they added much seasoning.', price: 5.00 },
    { name: 'Cheese Pizza', description: 'Slice of plain cheese pizza. Step above Chuck E. Cheese.', price: 3.00 },
    { name: 'Beef Macaroni', description: 'Leftover ground beef from the meatloaf mixed into mac \'n cheese.', price: 4.00 }
]

@side_dishes = [ 
    { name: 'Ceasar Calad', description: 'An iceburg lettuce salad with one sad, lonely cruton', price: 1.25 }, 
    { name: 'Fruit Salad', description: 'There\'s more marshmallows and Cool Whip than canned fruit.', price: 1.75 }, 
    { name: 'Boiled Carrots', description: 'These look a bit overcooked.', price: 1.50 },
    { name: 'Mashed Potatoes', description: 'Creamy mashed potatoes (no actual potatoes used).', price: 2.00 } ]

class Customer
    attr_accessor :tray, :total

    def initialize(tray, total)
        @tray = tray 
        @total = total
    end

    def tray_items
        food = @tray.map { |h| h[:name] }.join(', ')
        puts "You have #{food} on your tray.".colorize(:light_blue)
    end

    def tray_total
        total = @tray.map { |h| h[:price] }.reduce(0, :+) 
        puts "\nYour total is $#{total}".colorize(:light_green)
    end 
end 

def menu
    puts "\nGab's Cafeteria".colorize(:light_magenta)
    puts "\nChoose a main dish and two sides.".colorize(:light_blue)
    @complete_tray = Customer.new(Array.new, 0)
    @customers_trays << @complete_tray
    main_dish
    first_side
    second_side
    @complete_tray.tray_items
    @complete_tray.tray_total
end 

def main_dish
    puts "\nWhat is your main dish?".colorize(:light_blue)
    puts "1: Meatloaf".colorize(:light_cyan)
    puts "2: Cheese Pizza".colorize(:light_cyan)
    puts "3: Beef Macaroni".colorize(:light_cyan)

    main_dish_choice = gets.strip.to_i
    case main_dish_choice
    when 1 
        main_dish_choice = 0
    when 2
        main_dish_choice = 1
    when 3
        main_dish_choice = 2
    else
        puts "\nChoose from the menu, kid.".colorize(:light_magenta)
        main_dish
    end

    return @complete_tray.tray << @main_dishes[main_dish_choice]
end

def first_side
    puts "\nWhat is your first side?".colorize(:light_blue)
    puts "1: Ceasar Salad".colorize(:light_cyan)
    puts "2: Fruit Salad".colorize(:light_cyan)
    puts "3: Boiled Carrots".colorize(:light_cyan)
    puts "4: Mashed Potatoes".colorize(:light_cyan)
    first_side_choice = gets.strip.to_i
    case first_side_choice
    when 1 
        first_side_choice = 0
    when 2
        first_side_choice = 1
    when 3
        first_side_choice = 2
    when 4 
        first_side_choice = 3
    else
        puts "\nChoose from the menu, kid.".colorize(:light_magenta)
        first_side
    end

    return @complete_tray.tray.insert(1, @side_dishes[first_side_choice])
end

def second_side
    puts "\nWhat is your second side?".colorize(:light_blue)
    puts "1: Ceasar Salad".colorize(:light_cyan)
    puts "2: Fruit Salad".colorize(:light_cyan)
    puts "3: Boiled Carrots".colorize(:light_cyan)
    puts "4: Mashed Potatoes".colorize(:light_cyan)
    second_side_choice = gets.strip.to_i
    case second_side_choice
    when 1 
        second_side_choice = 0
    when 2
        second_side_choice = 1
    when 3
        second_side_choice = 2
    when 4
        second_side_choice = 3
    else
        puts "\nChoose from the menu, kid.".colorize(:light_magenta)
        second_side
    end

    return @complete_tray.tray.insert(2, @side_dishes[second_side_choice])
end

menu