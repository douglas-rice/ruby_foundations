# Add up all of the ages from our current Munster family hash:

ages = { 
  "Herman" => 32, 
  "Lily" => 30, 
  "Grandpa" => 5843, 
  "Eddie" => 10, 
  "Marilyn" => 22, 
  "Spot" => 237 
}

age_total = 0
ages.each_value do |age|
  age_total += age
end

puts "All of the ages together = #{age_total}"

# finished but looking at Tealeaf solution (ages.values.inject)