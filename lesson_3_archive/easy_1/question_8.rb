# If we build an array like this:

flintstones = ['Fred', 'Wilma']
flintstones << ['Barney', 'Betty']
flintstones << ['BamBam', 'Pebbles']

flintstones.flatten!

p flintstones