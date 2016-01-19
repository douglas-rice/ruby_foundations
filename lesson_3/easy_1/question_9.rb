# Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# Turn this into an array containing only two elements: 
# Barney's name and Barney's number

my_array = []

flintstones.each do |k, v|
  if k == "Barney"
    my_array << k
    my_array << v
  end 
end

p my_array