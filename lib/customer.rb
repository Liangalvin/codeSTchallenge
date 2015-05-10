
class Customer
# customer has cash
# customer has chocolate wrappers
# customer can buy chocolates
# see customer status name/cash on hand/ number of wrappers / number of types of choclates
# customer can trade wrappers for chocolates && BONUSES

  attr_accessor :name, :cash, :wrappers, :chocolates, :price, :trade_value

  def initialize(name, cash)
    @name = name
    @cash = cash
    @wrappers = 0
    @chocolates =  {  white: 0,
                      milk: 0,
                      dark: 0,
                      sugarfree: 0
                   }
    @price =       {  white: 2,
                      milk: 2,
                      dark: 4,
                      sugarfree: 2
                    }
    @trade_value =  { white: 2,
                      milk: 5,
                      dark: 4,
                      sugarfree: 2
                    }
  end

  def info
    puts "#{name} has $#{cash}, total of #{wrappers} wrappers, #{chocolates[:white]} white chocolates, #{chocolates[:milk]} milk chocolates, #{chocolates[:dark]} dark chocolates and #{chocolates[:sugarfree]} sugar-free chocolates."
    return "#{name} has $#{cash}, total of #{wrappers} wrappers, #{chocolates[:white]} white chocolates, #{chocolates[:milk]} milk chocolates, #{chocolates[:dark]} dark chocolates and #{chocolates[:sugarfree]} sugar-free chocolates."
  end

  def buy_type(type)
    if(type === "milk" || type === "dark" || type === "white" || type === "sugarfree")
      if @cash >= @price[:"#{type}"]
        @cash -= @price[:"#{type}"]
        @chocolates[:"#{type}"] += 1
        @wrappers += 1
        puts "#{name} bought a piece of #{type}, total of #{@chocolates[:"#{type}"]} #{type} chocolates with $#{cash} left"
      else
        puts "not enough cash"
        return "not enough cash"
      end
    else
      puts "not a type"
      return "not a type"
    end
  end

  def trade_for(type)
    if type === "white" || type === "milk" || type === "dark" || type === "sugarfree"
      if type === "milk" && @wrappers >= @trade_value[:milk]
        @wrappers -= @trade_value[:milk]
        @chocolates[:milk] += 1
        @chocolates[:sugarfree] += 1
        @wrappers += 2
        puts "#{name} traded in #{@trade_value[:milk]} wrappers for milk chocolate and a bonus sugar-free given"
        return "#{name} traded in #{@trade_value[:milk]} wrappers for milk chocolate and a bonus sugar-free given"
      elsif type === "white" && @wrappers >= @trade_value[:white]
        @wrappers -= @trade_value[:white]
        @chocolates[:white] += 1
        @chocolates[:sugarfree] += 1
        @wrappers += 2
        puts "#{name} traded in #{@trade_value[:white]} wrappers for white chocolate and a bonus sugar-free given"
        return "#{name} traded in #{@trade_value[:white]} wrappers for white chocolate and a bonus sugar-free given"
      elsif type === "sugarfree" && @wrappers >= @trade_value[:sugarfree]
        @wrappers -= @trade_value[:sugarfree]
        @chocolates[:sugarfree] += 1
        @chocolates[:dark] += 1
        @wrappers += 2
        puts "#{name} traded in #{@trade_value[:sugarfree]} wrappers for a sugarfree chocolate a bonus dark chocolate given"
        return "#{name} traded in #{@trade_value[:sugarfree]} wrappers for a sugarfree chocolate a bonus dark chocolate given"
      elsif type === "dark" && @wrappers >= @trade_value[:dark]
        @wrappers -= @trade_value[:dark]
        @chocolates[:dark] += 1
        @wrappers += 1
        puts "#{name} traded in #{@trade_value[:dark]} wrappers for a dark chocolates"
        return "#{name} traded in #{@trade_value[:dark]} wrappers for a dark chocolates"
      else
        puts "Not enough wrappers"
        return "Not enough wrappers"
      end
    else
      puts "Chocolate does not exist"
      return "Chocolate does not exist"
    end
  end

end
