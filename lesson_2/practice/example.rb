# Given a sentence, return true if the sentence is a palindrome.

# Ignore whitespace and cases of characters.

# Given "Never odd or even" the method should return true

def palindrome?(sentence)
  sentence.downcase.delete(' ') == sentence.downcase.reverse.delete(' ')
end


boo = "hello world"
puts palindrome?(boo)

foo = "Never odd or even"
puts palindrome?(foo)