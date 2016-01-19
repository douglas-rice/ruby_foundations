# Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the keys and the 
# values are the positions in the array.

my_hash = {}

flintstones.each_with_index do |name, idx|
  my_hash[name] = idx + 1
end

p my_hash