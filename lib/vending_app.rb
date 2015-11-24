choice = ''

class Machine
  attr_accessor :returnedProduct, :choice, :coins, :totalMoney, :products

  def initialize
    @money=false
    @products=['mars', 'dairy milk']
    @choice=''
    @returnedProduct
    @coins= {
      10 => 50,
      20 => 25
    }
    
  end

  def hasChocolateBars?
    @products.length >=1
  end

  def loadProducts
    @products=['mars','dairy milk']
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
  end

end