require_relative './vending_app'

machine = Machine.new

puts machine.message

machine.choice = gets.chomp

  until machine.productNames.include?(machine.choice) do
    puts "That product isn't available. Please type one of #{machine.productNames}"
    machine.choice = gets.chomp
  end

puts "You've chosen a #{machine.choice}. The price is #{machine.products[machine.choice]}p"

until  machine.totalThisPurchase >= machine.products[machine.choice] do
  
  machine.checkPrice

  puts machine.message

  machine.latestCoin = gets.chomp.to_i

  until machine.denominations.include?(machine.latestCoin) do
    puts "That's not a coin. Please type one of #{machine.denominations}"
    machine.latestCoin = gets.chomp.to_i
  end

  machine.addCoin machine.latestCoin
  machine.sumCoins

end

machine.checkPrice


puts machine.message









