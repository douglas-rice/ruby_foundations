# Write a method that takes an array of integers, and returns a 
# new array with every other element

# ----------------------------------------------
# keyword             => meaning
# START               => start of the program
# SET                 => sets a variable we can use for later
# GET                 => retrieve input from user
# PRINT               => displays output to user
# READ                => retrieve value from variable
# IF / ELSE IF / ELSE => show conditional branches in logic
# WHILE               => show looping logic
# END                 => end of the program

# ----------------------------------------------

# Given a collection of integers
# Iterate through the collection one by one
# Save every other value

# GET array of ints
# SET iterator i = 0
# WHILE i < length of array
#     save array[i] to new array
#     i = i + 2
# END

arr = [3, 7, 2, 4, 1, 9, 8, 13, 55, 5, 6, 23, 14]
i = 0
new_arr = []

while i < arr.length
  new_arr << arr[i]
  i += 2
end

puts new_arr.inspect