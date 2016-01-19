# Create a hash that expresses the frequency with which each letter 
# occurs in this string:

statement = "The Flintstones Rock"

my_hash = {}

letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  my_hash[letter] = letter_frequency if letter_frequency > 0
end

p my_hash