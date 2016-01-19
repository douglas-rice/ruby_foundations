# In this hash of people and their age,

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if there is an age present for "Spot".

# Bonus: What are two other hash methods that would work just as well for 
# this solution?

def check_again?
  answer = nil
  loop do
    puts "Would you like to check another key? (y/n)"
    answer = gets.chomp
    break if ['y', 'n'].include?(answer.downcase)
    puts "Sorry, must be 'y' or 'n'"
  end 

  return true if answer.downcase == 'y'
  return false if answer.downcase == 'n'
end

def get_name
  name = ''
  loop do
    puts "Enter your name:"
    name = gets.chomp
    break unless name.empty?
    puts "Sorry, must enter a value."
  end 
  name
end

name = get_name
puts "Hi #{name}!"

loop do
  puts "Enter a name to find out if there's an age present:"
  name = gets.chomp

  if ages.has_key?(name)
    puts "Yes, there is an age present for #{name}: #{ages[name]}"
  else
    puts "No age present."
  end

  break unless check_again?

end

# methods that work:
# .has_key?
# .include?
# .member?