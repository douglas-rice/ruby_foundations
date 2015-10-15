def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0 # because "hi".to_i == 0
end

def operation_to_message(op)
  case op
  when '1'
    return 'Adding'
  when '2'
    return 'Subtracting'
  when '3'
    return 'Multiplying'
  when '4'
    return 'Dividing'
  end
end

prompt("Welcome to Calculator! Enter your name:")

name = '' # instantiating this var outside the loop so i can reference it later
loop do
  name = gets.chomp

  if name.empty?
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''

  loop do
    prompt("What's the first number?")
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt("Hmm...that doesn't look like a valid number.")
    end
  end

  number2 = ''

  loop do
    prompt("What's the second number?")
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt("Hmm...that doesn't look like a valid number.")
    end
  end

  # this is a 'heredoc', used for text spanning multiple lines
  operator_prompt = <<-MSG
What operation would you like to perform?
    1) addition
    2) subtraction
    3) multiplication
    4) division
  MSG

  prompt(operator_prompt)

  operator = ''

  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator) # does this array include the operator
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")
  puts ''
  sleep 1.2 # make it look like calculator is thinking

  case operator

  when '1'
    result = number1.to_i + number2.to_i
  when '2'
    result = number1.to_i - number2.to_i
  when '3'
    result = number1.to_i * number2.to_i
  when '4'
    result = number1.to_f / number2.to_f
  else
    "=> Invalid operator."
  end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? ('Y' to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using Calculator. Good bye!")
