# In the previous exercise we added Dino to our array like this:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# flintstones << "Dino"

# We could have used either Array#concat or Array#push to add Dino 
# to the family.

# How can we add multiple items to our array? (Dino and Hoppy)

flintstones += ['Dino', 'Hoppy']

p flintstones

# Launch Solution:

flintstones.concat(%w(Elvira, Smokey))
# # concat adds an array rather than one item

p flintstones