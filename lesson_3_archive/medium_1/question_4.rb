# What happens when we modify an array while we are iterating over it? 
# What would be output by this code?

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end

numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  numbers.shift(1)
end

# it would alter the iteration so that by the time it got to the 
# second iteration, the second item is now the third, etc.

# output => 1, 3

# What would be output by this code?

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end

# by the time it gets to the third iteration, the array is empty.