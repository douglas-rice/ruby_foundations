require 'pry'

def prompt(msg)
  puts "=> #{msg}"
end

def solution(num1, num2, operator, result)
  case operator
  when '1'
    prompt("#{num1} added to #{num2} equals #{result}")
  when '2'
    prompt("#{num2} subtracted from #{num1} equals #{result}")
  when '3'
    prompt("#{num1} multiplied by #{num2} equals #{result}")
  when '4'
    prompt("#{num1} divided by #{num2} equals #{result}")
  end
end

name = ''
prompt("Welcome to Calculator! Enter your name:")


loop do
  name = gets.chomp
  if name.empty?
    prompt("User must enter a name. Try again.")
  else
    break
  end
end

prompt("Hi #{name}!")

num1 = ''
num2 = ''

loop do # main loop
  loop do
    prompt("Enter the first number:")
    num1 = gets.chomp
    if num1.to_i.to_s == num1
      break
    else
      prompt("That doesn't look like a real number.")
    end
  end

  loop do
    prompt("Enter the second number:")
    num2 = gets.chomp
    if num2.to_i.to_s == num2
      break
    else
      prompt("That doesn't look like a real number.")
    end
  end

  operator = ''

  prompt(%{What operation would you like to perform?
  (1) Addition
  (2) Subtraction
  (3) Multiplication
  (4) Division})

  loop do
    operator = gets.chomp
    if "1 2 3 4".include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
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

  solution(num1, num2, operator, result)

  prompt("Do you want to perform another calculation? 'y' or 'n'")
  ans = gets.chomp.downcase
  if ans == 'y'
    next
  else
    break
  end
end

prompt("Thanks for using Calculator!")
