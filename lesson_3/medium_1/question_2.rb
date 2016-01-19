# Create a hash that expresses the frequency with which each letter 
# occurs in this string:

statement = "The Flintstones Rock"

letters = ('A'..'Z').to_a + ('a'..'z').to_a

my_hash = {}

letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  if letter_frequency > 0
    my_hash[letter] = letter_frequency
  end
end

p my_hash

puts "there you go."