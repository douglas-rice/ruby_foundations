def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
p names

add_name(names, 'jim')
puts names.inspect