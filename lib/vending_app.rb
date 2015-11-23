class Machine

  def initialize
    @money=false
    @products=false
  end

  def hasChocolateBars?
    @products
  end

  def loadProducts
    @products=true
  end

  def hasMoney?
    @money
  end

  def loadMoney
    @money = true
  end

end