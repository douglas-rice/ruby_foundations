# Given a collection of integers.

# Iterate through the collection one by one.
#   - save the first value as the starting value.
#   - for each iteration, compare the saved value with the 
#     current value.
#   - if the saved value is greater, or it's the same
#     - move to the next value in the collection
#   - otherwise, if the current value is greater
#     - reassign the saved value as the current value

# After iterating through the collection, return the 
# saved value.

# keyword             => meaning
# START               => start of the program
# SET                 => sets a variable we can use for later
# GET                 => retrieve input from user
# PRINT               => displays output to user
# READ                => retrieve value from variable
# IF / ELSE IF / ELSE => show conditional branches in logic
# WHILE               => show looping logic
# END                 => end of the program

# START

# Given a collection of integers called "numbers"

# SET iterator = 1
# SET saved_number = value within numbers collection at space 1

# WHILE iterator < length of numbers
#   SET current_number = value within numbers collection at 
#   space "iterator"
#   IF saved_number >= current_number
#     go to the next iteration
#   ELSE
#     saved_number = current_number

#   iterator = iterator + 1

# PRINT saved_number

# END


def find_greatest(numbers)
  saved_number = nil

  numbers.each do |num|
    saved_number ||= num
    if num >= saved_number
      saved_number = num
    end
  end

  saved_number
end

numbers = [3, 24, 6, 75, 23, 12, 67, 56, 44, 45, 32, 2, 34, 22, 46, 33]
puts find_greatest(numbers)

