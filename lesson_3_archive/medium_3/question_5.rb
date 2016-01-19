# How could the unnecessary duplication in this method be removed?

# Ruby will automatically evaluate statements, so this method:

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

# Can be significantly simplified by changing it to just:

def color_valid(color)
  color == "blue" || color == "green"
end

# Both of these methods do exactly the same thing - but one is much 
# more complex to read.