# The Ruby Array class has several methods for removing items from 
# the array. Two of them have very similar names. Let's see how they 
# differ:

numbers = [1, 2, 3, 4, 5]

# What does the follow method calls do (assume we reset numbers to 
# the original array between method calls)?

numbers.delete_at(1) # deletes at the index
numbers.delete(1) # deletes the number 1

p numbers

