# Debug this code to pass rspec! There are 3 mistakes to fix.

# Write a method, letter_count, that accepts a string and char as args. 
# The method should return the number of times that the char appears in the string.

require "byebug"

def letter_count(string, char)
    count = 0
    string.each_char do |c| 
        count += 1 if c.downcase == char  # changed = to ==. This will evaluate likeness instead of attempting to reassign. Also added .downcase to change the passed in "c" to lowercase.
    end
    count
end

puts letter_count("poopies", "o")