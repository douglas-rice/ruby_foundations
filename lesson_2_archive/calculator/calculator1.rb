require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(msg)
  puts "=> #{msg}"
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def number?(input)
  integer?(input) || float?(input)
end

def operation(op)
  word = case op
  when '1'
    "Adding"
  when '2'
    "Subracting"
  when '3'
    "Multiplying"
  when '4'
    "Dividing"
  end
  return word
end

system('clear')
prompt(MESSAGES['welcome'])

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end
prompt("Hello #{name}!")

loop do # main loop
  num1 = ''
  num2 = ''

  loop do
    prompt(MESSAGES['first_num'])
    num1 = gets.chomp
    if number?(num1)
      break
    else
      prompt(MESSAGES['valid_num'])
    end
  end

  loop do
    prompt(MESSAGES['second_num'])
    num2 = gets.chomp
    if number?(num2)
      break
    else
      prompt(MESSAGES['valid_num'])
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

  prompt(MESSAGES['go_again'])
  ans = gets.chomp
  if ans.downcase == 'y'
    system('clear')
    next
  else
    break
  end
end

prompt(MESSAGES['thanks'])

