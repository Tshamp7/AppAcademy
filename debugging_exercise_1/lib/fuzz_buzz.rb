# Debug this code to pass rspec! There is 1 mistake to fix.

# Write a method, fuzz_buzz, that accepts a number as an arg. 
# The method should return an array of numbers from one to the given number that are not divisible by 3 or 5.

require "byebug"

def fuzz_buzz(num)
    numbers = []

    (1..num).each do |i|
        if i % 3 != 0 && i % 5 != 0  # to make sure numbers that were passed to they array were not divisible by three or by 5, the logical operator needed to be changed to and to ensure that numbers that were not divisible by either were not passed to the list. 
            numbers << i
        end
    end

    numbers
end

puts fuzz_buzz(25)