require_relative './lib/customer.rb'

puts "          _______________________________________________"
puts "         |                                               |"
puts "         |              THEE CHOCOLATE SHOP              |"
puts "         -------------------------------------------------"
puts "         |                                               |"
puts "         |         *                           *         |"
puts "         |        *                             *        |"
puts "         |       *                               *       |"
puts "         |      *                                 *      |"
puts "         |     *            ___________            *     |"
puts "         |    *             |    |    |             *    |"
puts "         |                  |   0|0   |                  |"
puts "         |                  |    |    |                  |"
puts "         -------------------------------------------------"

puts "Welcome to 'thee Chocolate shop' where every chocolate is tasted before being sold for quality assurance. What is your name?"
name = gets.chomp.capitalize
puts "How much money have you brought ( *** input number only ex: $20 is 20 *** ) Please have some money"
cash = gets.chomp.to_i

customer = Customer.new(name, cash)
continue = true

while continue
  puts "Here are your options #{name}"
  puts "Type in 'Buy' to buy chocolates"
  puts "Type in 'Trade' to trade your wrappers for chocolates"
  puts "Type in 'Info' to see your current status"
  puts "Type in 'Exit' to exit the store"

  response = gets.chomp.downcase
  offer = "We offer white, milk, dark and sugarfree chocolates!"
  like = "What type of chocolate would you like?"


  if response === "buy"

    puts offer
    puts like
    res = gets.chomp.downcase

    customer.buy_type(res)

  elsif response === "trade"

    puts offer
    puts like
    puts "You currently have #{customer.wrappers} wrappers."
    res = gets.chomp

    customer.trade_for(res)

  elsif response === "exit"

    puts "Good day"

    continue = false

  elsif response === "info"

    customer.info

  else

    puts " *** Not a response *** "

  end

end #closes while loop
