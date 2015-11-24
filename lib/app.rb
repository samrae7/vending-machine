require_relative './vending_app'

machine = Machine.new


puts "Hit RETURN to buy something or enter 'x' to access engineer tasks"

 person = gets.chomp
  if person==''
    customer=true
  elsif person=='x'
    customer=false
  else
    puts 'Please re-enter'
  end

until customer==false do

  puts "Choose from #{machine.products}"

  choice = gets.chomp
  machine.choice = choice

  until machine.products.include?(choice) do
    puts "That product is out of stock. Please enter another"
    choice = gets.chomp
    machine.choice = choice
  end

    until machine.productNames.include?(machine.choice) do
      puts "That product isn't recognised. Please type one of #{machine.productNames}"
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

  machine.sellItem choice
  machine.coinsEnteredThisPurchase=[0]
  machine.totalThisPurchase = 0

  puts "Do you want to buy another? (Y/N)"
  continue_answer = gets.chomp
  if continue_answer=='N'
    customer=false
    exit
  end

end

# ENGINEER TASKS

  puts "Enter 'c' to reset cash OR 's' to reload stock"

  answer = gets.chomp
  if answer == 'c' then
    machine.loadMoney
    puts "Coins in the machine are reset: #{machine.coins}"

  elsif answer == 's' then
    machine.loadProducts
    puts "Products are restocked: #{machine.products}"
  end











