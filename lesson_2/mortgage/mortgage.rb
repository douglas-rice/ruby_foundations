require 'pry'

def mort_calc(loan, time, monthly_interest_rate)
  loan * ((monthly_interest_rate * (1 + monthly_interest_rate)**time) / ((1 + monthly_interest_rate)**time - 1))
end

def prompt(msg)
  puts "=> #{msg}"
end

loan = ''
years = ''
rate = ''

prompt("Welcome to Mortgage Calculator 5000. Please enter your name:")

name = ''
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
  loop do
    prompt("Enter the amount you'd like to borrow:")
    loan = gets.chomp
    if loan.empty? || loan.to_f < 1
      prompt("Please enter a valid loan amount.")
    else
      break
    end
  end

  loop do
    prompt("Enter the duration of the loan in years:")
    years = gets.chomp
    if years.empty? || years.to_i < 0
      prompt("Please enter a valid duration.")
    else
      break
    end
  end

  loop do
    prompt("What is the interest rate?")
    prompt("(Example: 5 for 5% or 2.5 for 2.5%)")
    rate = gets.chomp
    if rate.empty? || rate.to_f < 1
      prompt("Please enter a valid rate")
    else
      break
    end
  end

  prompt("Loan: $#{loan}")
  prompt("Duration: #{years} years")
  prompt("Rate: #{rate} percent")

  loan = loan.to_f
  time = years.to_i * 12
  annual_interest_rate = rate.to_f / 100
  monthly_interest_rate = annual_interest_rate / 12

  payment = mort_calc(loan, time, monthly_interest_rate)

  puts ''
  prompt("Your monthly payment for this loan would be $#{format('%02.2f', payment)}")
  puts ''
  prompt("Would you like another calucation? ('y' or 'n')")
  answer = gets.chomp
  if answer.downcase == 'y'
    next
  else
    break
  end
end

prompt("Thanks for using Mortgage Calculator 5000!")
prompt("Good bye!")
