require_relative '../lib/vending_app'

describe Machine do

  let(:machine) { Machine.new }

  it 'should have chocolate bars after we have loaded it' do
    machine.loadProducts
    expect(machine.hasChocolateBars?).to be true
  end

  it "should have no change before we've loaded it" do
    expect(machine.hasMoney?).to be false
  end

  it "should have change after we've loaded it" do
    machine.loadMoney
    expect(machine.hasMoney?).to be true
  end

  it "should have mutiple chocolate bars after we've loaded it" do
    machine.loadProducts
    expect(machine.products.length >= 1)
  end

  it "should have fewer chocolate bars when it sells one" do
    stock1 = machine.products.length
    machine.sellItem 'mars'
    stock2 = machine.products.length
    expect(stock2 < stock1).to be true
  end

  it "should give customer a mars bar when they choose mars bar" do
    machine.choice = 'mars'
    machine.choose
    expect(machine.returnedProduct).to eq('mars')
  end

  it "should give customer a dairy milk when they choose dairy milk" do
    machine.choice = 'dairy milk'
    machine.choose
    expect(machine.returnedProduct).to eq('dairy milk')
  end

  it "should have multiple types of coin" do
    expect(machine.coins.length >= 1).to be true
  end

  it "should have one or more coins after it has been loaded" do
    machine.coins={}
    machine.loadMoney
    expect(machine.coins.any? {|k,v| v > 0}).to be true
  end

  it "should have total money equal to zero when there are zero coins" do
    machine.coins = {
      1 => 100,
      2 => 100,
      5 => 100,
      10 => 50,
      20 => 25,
      50 => 20,
      1.00 => 10,
      2.00 => 5
    }
    expect(machine.totalMoney).to eq(0)
  end

  it "should increase total money by 10p when a 10p coin is added" do
    money1 = machine.totalMoney
    machine.addCoin 10
    money2 = machine.totalMoney
    expect(money2 - money1).to eq(0.1)
  end

  it "should increase number of 10p coins by 1 when a 10p coin is added" do
    tenPenceCoins = machine.coins[10]
    machine.addCoin 10
    expect(machine.coins[10]).to eq(tenPenceCoins + 1)
  end

  it "should remove a dairy milk from the inventory when it sells one" do
    machine.products=['mars', 'dairy milk']
    machine.sellItem 'dairy milk'
    expect(machine.products).to eq(['mars'])
  end

  it "should remove a mars from the inventory when it sells one" do
    machine.products=['mars', 'dairy milk']
    machine.sellItem 'mars'
    expect(machine.products).to eq(['dairy milk'])
  end

  it "should add an entered 20p piece to the tally of coins entered for the latest purchase" do
    machine.coinsEnteredThispurchase= [10,1,2,5]
    machine addCoin 20
    expect(machine.coinsEnteredThispurchase).to eq([10,1,2,5,20])
  end

end