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

  it "should add a 20p  to the tally of coins for the latest purchase when a 20p is entered" do
    machine.coinsEnteredThisPurchase= [10,1,2,5]
    machine addCoin 20
    expect(machine.coinsEnteredThisPurchase).to eq([10,1,2,5,20])
  end

end