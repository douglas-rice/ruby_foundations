# Build a command line calculator program that does the following:

# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiple or divide
# displays the result

require 'pry'
def prompt(msg)
  puts "=> #{msg}"
end

def valid_number?(num)
  num.to_i.to_s == num
end

def operation(operator)
  case operator
  when '1'
    "Adding"
  when '2'
    "Subtracting"
  when '3'
    "Multiplying"
  when '4'
    "Dividing"
  end
end

system 'clear'

prompt("Welcome to Calculator-X. Please enter your name:")
name = ''
loop do
  name = gets.chomp
  if name.empty?
    puts "You must enter a name."
  else
    break
  end
end
prompt("Hello, #{name}. Let's do some calculating!")

loop do # master loop
  num1 = ''
  loop do
    prompt("Enter the first number:")
    num1 = gets.chomp
    if valid_number?(num1)
      break
    else
      prompt("That doesn't look like a valid number. Try again.")
    end
  end

  num2 = ''
  loop do
    prompt("Enter the second number:")
    num2 = gets.chomp
    if valid_number?(num2)
      break
    else
      prompt("That doesn't look like a valid number. Try again.")
    end
  end

  operator = ''
  loop do
    prompt(%{What type of operation would you like to perform?
      (1) Addition
      (2) Subtraction
      (3) Multiplication
      (4) Division})

    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose from the available section.")
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

  sleep(2)

  prompt("The answer is #{result}")

  prompt("Would you like to perform another calculation? Enter 'yes' or 'no'")
  play_again = gets.chomp
  if play_again.downcase.start_with?('y')
    system 'clear'
    next
  else
    break
  end
end

prompt("Thanks for using Calculator-X. Bye, #{name}!")
