# Debug this code to pass rspec! There are 2 mistakes to fix.

# Write a method, prime?, that accepts a number. It should return a boolean indicating whether or not the given number 
# is a prime. A prime number is only divisible by 1 and itself, it should have no other divisors.

require "byebug"



def prime?(num) #method name was incorrect. Changed method name from prime to prime?
    return false if num < 2

    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end
    return true  # moved to true to end of method. The else was causing the true to return prematurely. 
end

puts prime?(1)