# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"
require "facets"

def largest_prime_factor(num)
  divisor_array = is_divisor?(num)

   divisor_array.each do |ele|
    if is_prime?(ele) == true
        return ele
    end
   end


end

def is_prime?(num) # finds larges number from divisor_array that is prime.
    if num == 1
        return false
    end
   
    (2...num).each do |char|
      if num % char == 0
        return false
      end
    end
  return true
end

def is_divisor?(num)  # finds all divisors of number in question
    div_arr = []

 (2..num).each do |char|
  if num % char == 0
    div_arr << char
  end
 end
 div_arr.reverse
end

def unique_chars?(str)
 letters = str.split("") # splits supplied string into individual characters. 
 counts = Hash.new(0) # creates a hash to iterate over, this will allow us to count all instances in the supplied string. 
 
 letters.each { |letter| counts[letter] += 1 }   # iterates over hash, counting chars. 

 counts.each_value do |v| # iterates through hash values, if a value is > 1, returns false, as there are duplicate chars present. 
  if v > 1
    return false
  end
 end
  
 return true
end

def dupe_indices(arr)
  counts = Hash.new(0) # creates a hash to count occurences of duplicate chars
  output = {} # output hash. 


 
  arr.each { |ele| counts[ele] += 1 }
 
 counts.each do |k, v|
  if v > 1
    output[k] = arr.each_index.select{|i| arr[i] == k } # for each element of the counts hash, create a key:value pair representing keys with an occurence > 1. Make the value of this key an array representing the indices of the occurences of the duplicate chars using #each_index and .select.
  end
 

 end


 output # implicit return of output hash
end

def ana_array(arr_1, arr_2)
 if arr_1.length != arr_2.length 
  return false
 end
 
 if arr_1.frequency == arr_2.frequency 
  return true
 end
    
 return false
end


