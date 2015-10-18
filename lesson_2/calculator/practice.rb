require 'pry'

def prompt(msg)
  puts "=> #{msg}"
end

def valid_number?(num)
  num.to_i != 0
end

def operation(op)
  case op
  when '1'
    return "Adding"
  when '2'
    return "Subracting"
  when '3'
    return "Multiplying"
  when '4'
    return "Dividing"
  end
end

system('clear')
prompt("Welcome to Calculator! Enter your name: ")

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt("You must enter a name:")
  else
    break
  end
end
prompt("Hello, #{name}!")

loop do # main loop
  num1 = ''
  num2 = ''

  loop do
    prompt("Enter the first number: ")
    num1 = gets.chomp
    if valid_number?(num1)
      break
    else
      prompt("That doesn't look like a real number.")
    end
  end

  loop do
    prompt("Enter the second number: ")
    num2 = gets.chomp
    if valid_number?(num2)
      break
    else
      prompt("That doesn't look like a real number.")
    end
  end

  operator = ''

  prompt(%{What operation would you like to perform?
  (1) addition
  (2) subtraction
  (3) multiplication
  (4) division})

  operator = ''

  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end

  case operator

  when '1'
    result = num1.to_i + num2.to_i
  when '2'
    result = num1.to_i - num2.to_i
  when '3'
    result = num1.to_i * num2.to_i
  when '4'
    result = num1.to_f / num2.to_f
  end

  prompt("#{operation(operator)} the two numbers...")
  puts ''
  sleep 1.2

  prompt("The answer is #{result}")

  prompt("Would you like to perform another calculation? Enter 'yes' or 'no'")
  ans = gets.chomp
  if ans.downcase == 'y'
    system('clear')
    next
  else
    break
  end
end

puts "Thanks for using Calculator!"
