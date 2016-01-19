# Build a command line calculator program that does the following:

# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiple or divide
# displays the result

def prompt(msg)
  puts "=> #{msg}"
end

def valid_number?(num)
  num.to_i.to_s == num
end

def operation_wording(operator)
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

prompt("Welcome to this awesome calculator. What's your name, by the way?")
name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt("Must enter name, dude.")
  else
    break
  end
end

prompt("Hey #{name}. Let's do some calculating!")

loop do # master loop
  num1 = ''
  loop do
    prompt("Enter the first number:")
    num1 = gets.chomp
    if valid_number?(num1)
      break
    else
      prompt("That doesn't look like a valid number, #{name}.")
    end
  end

  prompt("Awesome. Now enter the second number:")

  num2 = ''
  loop do
    num2 = gets.chomp
    if valid_number?(num2)
      break
    else
      prompt("That doesn't look like a valid number. Try again...")
    end
  end

  prompt(%{Alright, #{name}, what kind of operation would you like to perform? Choose from the following:
  (1) Addition
  (2) Subtraction
  (3) Multiplication
  (4) Division})

  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Response must include 1, 2, 3, or 4")
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

  prompt("#{operation_wording(operator)} the two numbers...")

  sleep(2)

  prompt("The result is: #{result}")

  prompt("Do you want to perform another calculation? (yes/no)")
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')

end

prompt("Thanks for using this awesome calculator, #{name}.  Goodbye!")













