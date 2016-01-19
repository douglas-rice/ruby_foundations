num = 6

loop do
  puts "we're in the outer loop"
  loop do  
    puts "we're in the inner loop"
    if num == 6
      break
    else
      next
    end
  end
  puts "did we break out?"
  break
end