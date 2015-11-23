require_relative '../lib/vending_app'

describe Machine do

  it 'should have chocolate bars after we have loaded it' do
    machine = Machine.new
    machine.loadProducts
    expect(machine.hasChocolateBars?).to be true
  end

  it "should have no change before we've loaded it" do
    machine = Machine.new
    expect(machine.hasMoney?).to be false
  end

  it "should have change after we've loaded it" do
    machine = Machine.new
    machine.loadMoney
    expect(machine.hasMoney?).to be true
  end

  
end