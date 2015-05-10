require_relative ("lib/customer.rb")

#Scenario 1
def explain_one
  puts "********** Scenario 1 ***********"
  bob = Customer.new("bob", 12)
  6.times {bob.buy_type("milk")}
  bob.trade_for("milk")
  bob.info
end

#Scenario 2
def explain_two
  puts "********** Scenario 2 ***********"
  bob = Customer.new("bob", 12)
  3.times {bob.buy_type("dark")}
  bob.trade_for("dark")
  bob.info
end

#Scenario 3
def explain_three
  puts "********** Scenario 3 ***********"
  bob = Customer.new("bob", 6)
  bob.trade_value[:dark] = 2
  3.times {bob.buy_type("sugarfree")}
  bob.trade_for("sugarfree")
  bob.trade_for("sugarfree")
  bob.trade_for("dark")
  bob.info
end

def explain_four
  puts "********** Scenario 4 ***********"
  bob = Customer.new("bob", 6)
  3.times {bob.buy_type("white")}
  bob.trade_for("white")
  bob.trade_for("white")
  bob.trade_for("sugarfree")
  bob.info
end

explain_one()
explain_two()
explain_three()
explain_four()
