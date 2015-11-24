require 'pry'

class Machine
  attr_accessor :returnedProduct, :choice, :coins, :totalMoney, :products, :coinsEnteredThisPurchase, :money, :totalThisPurchase, :message

  def initialize
    @message = "please enter more money"
    @money= false
    @products = {
      'mars'=> 70,
      'dairy milk' => 65,
      'twix' => 55,
      'kit kat' => 110,
      'toblerone' => 220 
    }
    @choice=''
    @returnedProduct
    @coins = {
      1 => 100,
      2 => 100,
      5 => 100,
      10 => 50,
      20 => 25,
      50 => 20,
      100 => 10,
      200 => 5
    }
    @coinsEnteredThisPurchase=[]
    @totalThisPurchase
    
  end

  def hasChocolateBars?
    @products.length >=1
  end

  def loadProducts
    @products = {
      'mars'=> 70,
      'dairy milk' => 65,
      'twix' => 55,
      'kit kat' => 110,
      'toblerone' => 220 
    }

  end

  def hasMoney?
    @money
  end

  def loadMoney
    @money = true
    @coins = {
      1 => 100,
      2 => 100,
      5 => 100,
      10 => 50,
      20 => 25,
      50 => 20,
      100 => 10,
      200 => 5
    }
  end

  def products
    @products
  end

  def sellItem product
    @products.delete(product)
  end

  def choose
    @returnedProduct = @choice
  end
  # question about the above function and the corresponding test - why can't I just define choice as a property of machine and then set it in the test?

  def addCoin denomination
    @coins[denomination] += 1
    @coinsEnteredThisPurchase << denomination
  end

  def sumCoins
    @totalThisPurchase = @coinsEnteredThisPurchase.reduce :+
  end

  def checkPrice
    if @totalThisPurchase === @products[@choice] then
      @message = "Please collect your chocolate below"
    elsif @totalThisPurchase >= @products[@choice] then
      change = @totalThisPurchase - @products[@choice]
      @message = "Your change is " + change.to_s + "p. Please collect your chocolate below."
    else
      @message = "please enter more money"
    end
  end

  def sayPrice
    @message = "You chose a " + @choice + ". Please enter " + @products[@choice].to_s + "p"
  end

end