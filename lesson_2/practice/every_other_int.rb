# Do a few practice rounds on using pseudo-code to guide your problem solving logic.

# Write out pseudo-code a method that takes an array of integers, and 
# returns a new array with every other element.

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
# START

# given a collection of integers called "arr_of_ints"

# SET interator = 1
# SET new_arr = []
# while iterator <= length of "arr_of_ints"
#     new_arr = new_arr + arr_of_strings[i]
#     iterator = iterator + 2
# PRINT new_arr


# ----------------------------------------------

arr_of_ints = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

def every_other(some_ints)
  new_arr = []
  some_ints.each_with_index do |int, i|
    if i % 2 == 0
      new_arr << int
    end
  end
  new_arr
end

my_new_array = every_other(arr_of_ints)
p my_new_array