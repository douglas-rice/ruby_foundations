# Ben was tasked to write a simple ruby method to determine if an input string 
# is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is 
# not familiar with regular expressions. Alyssa supplied Ben with a method 
# called is_a_number? to determine if a string is a number and asked Ben to 
# use it.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_a_number?(word)
  end

  true
end

# Alyssa reviewed Ben's code and says "It's a good start, but you missed a 
# few things. You're not returning a false condition, and not handling the 
# case that there are more or fewer than 4 components to the IP address 
# (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

# Help Ben fix his code.

# There are several ways to fix this. To determine if there are exactly 
# 4 dot-separated "words" in the string, you can simply add a check for 
# dot_separated_words.size after splitting the string.

# The other error in Ben's code is that instead of returning false 
# upon encountering a non-numeric component, he used break to break 
# out of the while loop. Once he breaks, control falls through to the 
# return true statement. He can fix this by performing return false 
# instead of break.

# Note: Ben's original return true on the last line of the method can be 
# shortened to just true. This is because Ruby returns the result of the 
# last line of any method by default.

str = "4325.3534.3563.4536"

puts dot_separated_ip_address?(str)