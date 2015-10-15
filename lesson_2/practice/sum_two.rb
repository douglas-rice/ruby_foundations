# write a method that returns the sum of two integers

# pseudocode

# START

# GET value 'x' from user
# GET value 'y' from user

# PRINT x + y

# END

def sum_two_nums(x, y)
  sum = x + y
  puts "The sum of #{x} and #{y} is #{sum}"

end

puts "Enter first value: "
num1 = gets.chomp.to_i

puts "Enter second value: "
num2 = gets.chomp.to_i

sum_two_nums(num1, num2)




