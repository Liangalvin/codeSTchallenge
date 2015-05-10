require_relative '../lib/customer.rb'

RSpec.configure do |config|
  config.failure_color = :red
  config.success_color = :yellow
  config.tty = true
  config.color = true
end

describe Customer do
  let(:bob){Customer.new("Bobby", 36)}

  describe "New customer" do
    it "is new customer named Bobby" do
      expect(bob.name).to eq("Bobby")
      expect(bob.name).not_to eq("bobby")
    end

    it "Bobby currently has 36 dollars" do
      expect(bob.cash).to eq(36)
    end

    it "Bobby currently has no wrappers" do
      expect(bob.wrappers).to eq(0)
    end

    it "Bobby currently has no chocolates" do
      sum = bob.chocolates[:white] + bob.chocolates[:milk] + bob.chocolates[:dark] + bob.chocolates[:sugarfree]
      expect(sum).to eq(0)
      expect(sum).not_to eq(1)
    end
  end

  describe "Info" do
    it "Show Bobby's current customer information" do
      expect(bob.info).to eq("Bobby has $36, total of 0 wrappers, 0 white chocolates, 0 milk chocolates, 0 dark chocolates and 0 sugar-free chocolates.")
    end
  end

  describe "Chocolate prices" do
    it "1 white chocolate should cost to $2 " do
      expect(bob.price[:white]).to eq(2)
    end

    it "1 milk chocolate should cost to $2" do
      expect(bob.price[:milk]).to eq(2)
    end

    it "1 dark chocolate should cost to $4" do
      expect(bob.price[:dark]).to eq(4)
    end

    it "1 sugar-free chocolate cost equal $2 but should really be free" do
      expect(bob.price[:sugarfree]).to eq(2)
      expect(bob.price[:sugarfree]).not_to eq(3)
    end
  end

  describe "Chocolate trade values" do
    it "2 wrappers for white chocolate" do
      expect(bob.trade_value[:white]).to eq(2)
    end

    it "5 wrappers for milk chocolate" do
      expect(bob.trade_value[:milk]).to eq(5)
      expect(bob.trade_value[:milk]).not_to eq(100)
    end

    it "4 wrappers for dark chocolate" do
      expect(bob.trade_value[:dark]).to eq(4)
    end

    it "2 wrappers for sugar-free chocolate" do
      expect(bob.trade_value[:sugarfree]).to eq(2)
      expect(bob.trade_value[:sugarfree]).not_to eq(3)
    end
  end

  describe "Bobby buying chocolate" do
    it "should be able to buy white chocolates and have 1 wrapper" do
      bob.buy_type("white")
      expect(bob.chocolates[:white]).to eq(1)
      expect(bob.wrappers).to eq(1)
    end

    it "should be able to buy 2 milk chocolates and have 2 wrappers" do
      2.times {bob.buy_type("milk")}
      expect(bob.chocolates[:milk]).to eq(2)
      expect(bob.wrappers).to eq(2)
    end

    it "should be able to buy 3 dark chocolates and have 3 wrappers" do
      3.times {bob.buy_type("dark")}
      expect(bob.chocolates[:dark]).to eq(3)
      expect(bob.wrappers).to eq(3)
    end

    it "should be able to buy sugar-free chocolates and have 4 wrappers" do
      4.times {bob.buy_type("sugarfree")}
      expect(bob.chocolates[:sugarfree]).to eq(4)
      expect(bob.wrappers).to eq(4)
      expect(bob.wrappers).not_to eq(5)
    end

    it "should be able to buy only 'white', 'milk', 'dark', 'sugarfree'" do
      expect(bob.buy_type("fake")).to eq("not a type")
    end

    it "should be able to buy with less then or equal $36" do
      8.times {bob.buy_type("dark")}
      expect(bob.chocolates[:dark]).to eq(8)
      expect(bob.cash).to eq(4)
    end

    it "should not be able exceed purchase amount with insufficent funds" do
      50.times {bob.buy_type("dark")}
      expect(bob.chocolates[:dark]).to eq(9)
      expect(bob.buy_type("dark")).to eq("not enough cash")
    end
  end

  describe "Trade in wrappers" do
    it "should be able to trade wrappers for white chocolate" do
      3.times {bob.buy_type("sugarfree")}
      bob.trade_for("white")
      expect(bob.chocolates[:white]).to eq(1)
      expect(bob.chocolates[:sugarfree]).to eq(4)
    end

    it "should be able to trade wrappers for milk chocolate" do
      5.times {bob.buy_type("white")}
      bob.trade_for("milk")
      expect(bob.chocolates[:white]).to eq(5)
      expect(bob.chocolates[:milk]).to eq(1)
      expect(bob.chocolates[:sugarfree]).to eq(1)
    end

    it "should be able to trade wrappers for dark chocolate" do
      10.times {bob.buy_type("sugarfree")}
      2.times {bob.trade_for("dark")}
      expect(bob.chocolates[:sugarfree]).to eq(10)
      expect(bob.chocolates[:dark]).to eq(2)
      expect(bob.chocolates[:milk]).to eq(0)
      expect(bob.chocolates[:white]).to eq(0)
    end

    it "should be able to trade wrappers for sugarfree chocolate" do
      6.times {bob.buy_type("dark")}
      3.times {bob.trade_for("sugarfree")}
      expect(bob.chocolates[:dark]).to eq(9)
      expect(bob.chocolates[:sugarfree]).to eq(3)
    end

    it "should not be able to trade wrappers for non chocolate" do
      3.times {bob.buy_type("white")}
      expect(bob.trade_for("fake")).to eq("Chocolate does not exist")
    end

    it "should not be able to trade wrappers if insufficient amoutn" do
      3.times {bob.buy_type("milk")}
      expect(bob.trade_for("dark")).to eq("Not enough wrappers")
      expect(bob.chocolates[:milk]).to eq(3)
      expect(bob.chocolates[:dark]).to eq(0)
    end
  end
end

describe "EXPLANATIONS" do
  let(:bobby){Customer.new("Bobby", 12)}

  describe "The 4 scenarios" do
    it "1. He buys 6 milk chocolates and trades in 5 wrappers to get 1 free milk chocolate. He also gets one sugar free" do
      6.times {bobby.buy_type("milk")}
      bobby.trade_for("milk")
      expect(bobby.chocolates[:milk]).to eq(7)
      expect(bobby.chocolates[:sugarfree]).to eq(1)
      expect(bobby.chocolates[:white]).to eq(0)
      expect(bobby.chocolates[:dark]).to eq(0)
      expect(bobby.price[:milk]*6).to eq(12)
      expect(bobby.cash).to eq(0)
      expect(bobby.wrappers).to eq(3)
    end

    it "2. He buys 3 dark chocolates, but since wrappers needed is 4 he can't trade any wrappers in to get anything free." do
      3.times {bobby.buy_type("dark")}
      expect(bobby.trade_for("dark")).to eq("Not enough wrappers")
      expect(bobby.chocolates[:dark]).to eq(3)
      expect(bobby.chocolates[:white]).to eq(0)
      expect(bobby.chocolates[:milk]).to eq(0)
      expect(bobby.chocolates[:sugarfree]).to eq(0)
      expect(bobby.price[:dark]*3).to eq(12)
      expect(bobby.cash).to eq(0)
      expect(bobby.wrappers).to eq(3)
    end

    it "3. He can buy 3 sugar_free chocolates for $6. Now he can give 2 of this 3 wrappers and get 1 sugar_free chocolate. Again, he can use his 1 unused wrapper and 1 wrapper of new chocolate to get one more chocolate. Total is 5 sugar free. Since he got 2 bonus sugar_free chocolates, he also gets 2 bonus dark chocolates. And since he got 2 dark chocolates, he can trade both of those in for an extra dark." do
      bobby.trade_value[:dark] = 2
      3.times {bobby.buy_type("sugarfree")}
      expect(bobby.wrappers).to eq(3)
      bobby.trade_for("sugarfree")
      expect(bobby.wrappers).to eq(3)
      bobby.trade_for("sugarfree")
      expect(bobby.wrappers).to eq(3)
      bobby.trade_for("dark")
      expect(bobby.wrappers).to eq(2)
      expect(bobby.chocolates[:sugarfree]).to eq(5)
      expect(bobby.chocolates[:dark]).to eq(3)
      expect(bobby.chocolates[:white]).to eq(0)
      expect(bobby.chocolates[:milk]).to eq(0)
    end

    it "4. He buys 3 white and trades in 2 white wrappers for 1 white and 1 sugar free. Now he can use the extra white wrapper to get another white and another sugar free. Those 2 sugar free wrappers get another sugar free and a dark." do
      3.times {bobby.buy_type("white")}
      bobby.trade_for("white")
      bobby.trade_for("white")
      bobby.trade_for("sugarfree")
      expect(bobby.chocolates[:white]).to eq(5)
      expect(bobby.chocolates[:sugarfree]).to eq(3)
      expect(bobby.chocolates[:dark]).to eq(1)
      expect(bobby.chocolates[:milk]).to eq(0)
      expect(bobby.wrappers).to eq(3)
    end
  end
end
