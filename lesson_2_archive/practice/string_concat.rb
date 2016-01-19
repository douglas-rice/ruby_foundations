# write a method that takes an array of strings, and returns 
# a string that is all those strings concatenated together.

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
# START

# given a collection of strings called "arr_of_strings"

# SET interator = 1
# SET new_arr = ''
# while iterator <= length of "arr_of_strings"
#     new_arr = new_arr + arr_of_strings[i]
#     iterator = iterator + 1
# PRINT new_arr


# ----------------------------------------------

def concat_string(arr_of_strings)
  new_arr = ''
  arr_of_strings.each do |str|
    new_arr += str
  end
  puts new_arr
end

bingo = ['cat', 'dog', 'bird', 'rabbit']

concat_string(bingo)