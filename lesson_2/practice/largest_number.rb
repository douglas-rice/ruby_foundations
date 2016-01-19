# Write a method that determines which number is greatest in a collection.

# Pseudocode:

# START

# # Given a collection of integers called "numbers"

# SET iterator = 1
# SET saved_number = value within numbers collection at space 1

# WHILE iterator < length of numbers
#   SET current_number = value within numbers collection at space "iterator"
#   IF saved_number >= current_number
#     go to the next iteration
#   ELSE
#     saved_number = current_number

#   iterator = iterator + 1

# PRINT saved_number

END

require 'pry'

def find_largest(numbers)
  saved_number = numbers.first

  numbers.each do |num|
    if saved_number >= num
      next
    else
      saved_number = num
    end
  end
  saved_number
end

set = [3, 5, 21, 89, 19, 1, 9, 4, 8]

puts find_largest(set)