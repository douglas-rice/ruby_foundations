def prompt(msg)
  puts "=> #{msg}"
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def payment_calculator(loan, time, monthly_interest_rate)
  loan * (monthly_interest_rate * (1 + monthly_interest_rate)**time) / ((1 + monthly_interest_rate)**time - 1)
end

name = ''
loan = ''
time = ''
monthly_interest_rate = ''

system 'clear'

prompt("Welcome to Mortgage Calculator 6000. Please enter your name:")
loop do
  name = gets.chomp
  if name.empty?
    prompt("Make sure to enter a valid name.")
  else
    break
  end
end

prompt("Hello #{name}.")

loop do # main loop
  prompt("Enter the amount you'd like to borrow:")
  loop do
    loan = gets.chomp
    if integer?(loan)
      break
    else
      prompt("Please enter a valid amount.")
    end
  end

  prompt("Enter the duration of the loan in years:")
  loop do
    time = gets.chomp
    if integer?(time)
      break
    else
      prompt("Please enter a valid duration.")
    end
  end

  prompt(%{What is the interest rate?
     (Example: 5 for 5% or 2.5 for 2.5%)})

  loop do
    monthly_interest_rate = gets.chomp
    if float?(monthly_interest_rate) || integer?(monthly_interest_rate) 
      break
    else
      prompt("Please enter a valid interest rate.")
    end
  end

  puts ''

  prompt("Loan: #{loan}")
  prompt("Duration: #{time} years")
  prompt("Rate: #{monthly_interest_rate} percent")

  loan = loan.to_i
  time = time.to_i * 12
  monthly_interest_rate = (monthly_interest_rate.to_f / 100) / 12

  payment = payment_calculator(loan, time, monthly_interest_rate)

  prompt("Your monthly payment will be: $#{format('%02.2f', payment)}")

  puts ''

  prompt("Would you like to calculate another payment? Enter 'yes' or 'no'")
  go_again = gets.chomp.downcase
  if go_again.start_with?('y')
    system 'clear'
    next
  else
    break
  end
end

prompt("Thanks for using Mortgage Calculator 6000! Goodbye, #{name}.")
