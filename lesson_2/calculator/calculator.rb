puts "Welcome to Caculator!"

while true
  puts "What's the first number?"
  number1 = gets.chomp

  puts "What's the second number?"
  number2 = gets.chomp

  puts "What operation would you like to perform?:"
  puts " 1) add 2) subtract 3) multiply 4) divide"
  operator = gets.chomp

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
    "Invalid operator."
  end

  puts "The result is #{result}"
  puts "Do you want to perform another calculation? (y/n)"
  answer = gets.chomp.downcase
  if answer == 'n'
    break
  end
end
