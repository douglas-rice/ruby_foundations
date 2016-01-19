# In another example we used some built-in string methods to change 
# the case of a string. A notably missing method is something provided 
# in Rails, but not in Ruby itself...titleize! This method in Ruby on 
# Rails creates a string that has each word capitalized as it would be 
# in a title.

# Write your own version of the rails titleize implementation.

# NEXT

def titleize(str)
  str = str.split
  str.each do |word|
    word.capitalize!
  end
  str = str.join(' ')
end

title = "the good wife"
puts titleize(title)

# Launch solution:

str.split.map { |word| word.downcase.capitalize }.join(' ')
