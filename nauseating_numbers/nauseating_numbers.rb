require "matrix"
#strange_sums
#Write a method strange_sums that accepts an array of numbers as an argument. 
#The method should return a count of the number of distinct pairs of elements that have a sum of zero. 
#You may assume that the input array contains unique elements.
#
#Examples
#
#p strange_sums([2, -3, 3, 4, -2])     # 2
#p strange_sums([42, 3, -1, -42])      # 1
#p strange_sums([-5, 5])               # 1
#p strange_sums([19, 6, -3, -20])      # 0
#p strange_sums([9])                   # 0

def strange_sums(arr)
    count = 0
    arr.each_with_index do |ele, i|
        arr.each_with_index do |ele2, i2|
            if i > i2
                if ele + ele2 == 0
                    count += 1
                end
            end
        end
    end
    count
end

#pair_product
#Write a method pair_product that accepts an array of numbers and a product as arguments. 
#The method should return a boolean indicating whether or not a pair of distinct elements in the array result in the product when multiplied together. 
#You may assume that the input array contains unique elements.
#
#Examples
#
#p pair_product([4, 2, 5, 8], 16)    # true
#p pair_product([8, 1, 9, 3], 8)     # true
#p pair_product([3, 4], 12)          # true
#p pair_product([3, 4, 6, 2, 5], 12) # true
#p pair_product([4, 2, 5, 7], 16)    # false
#p pair_product([8, 4, 9, 3], 8)     # false
#p pair_product([3], 12)             # false

def pair_product(arr, n)
    arr.each_with_index do |ele, i|
        arr.each_with_index do |ele2, i2|
            if i > i2
                if ele * ele2 == n
                    return true
                end
            end
        end
    end
    false
end

#rampant_repeats
#Write a method rampant_repeats that accepts a string and a hash as arguments. 
#The method should return a new string where characters of the original string are repeated the number of times specified by the hash. 
#If a character does not exist as a key of the hash, then it should remain unchanged.
#
#Examples
#
#p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
#p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
#p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
#p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def rampant_repeats(str, hash)
    output = ""
        str.each_char.with_index do |char, i|
            if hash.has_key?(char)
                hash[char].times { output += char }
            else
                output += char
            end
        end
    output
end

#perfect_square?
#Write a method perfect_square? that accepts a number as an argument. 
#The method should return a boolean indicating whether or not the argument is a perfect square. 
#A perfect square is a number that is the product of some number multiplied by itself. For example, 
#since 64 = 8 * 8 and 144 = 12 * 12, 64 and 144 are perfect squares; 35 is not a perfect square.
#
#Examples
#
#p perfect_square(1)     # true
#p perfect_square(4)     # true
#p perfect_square(64)    # true
#p perfect_square(100)   # true
#p perfect_square(169)   # true
#p perfect_square(2)     # false
#p perfect_square(40)    # false
#p perfect_square(32)    # false
#p perfect_square(50)    # false

def perfect_square?(n)
    (1..n).each do |num|
        if num * num == n
            return true
        end
    end
    false
end

#anti_prime?
#Write a method anti_prime? that accepts a number as an argument. 
#The method should return true if the given number has more divisors than all positive numbers less than the given number.
#For example, 24 is an anti-prime because it has more divisors than any positive number less than 24. 
#Math Fact: Numbers that meet this criteria are also known as highly composite numbers.
#
#Examples
#
#p anti_prime?(24)   # true
#p anti_prime?(36)   # true
#p anti_prime?(48)   # true
#p anti_prime?(360)  # true
#p anti_prime?(1260) # true
#p anti_prime?(27)   # false
#p anti_prime?(5)    # false
#p anti_prime?(100)  # false
#p anti_prime?(136)  # false
#p anti_prime?(1024) # false

def anti_prime?(n)
    div_arr = []
    (1..n).each do |num|
       div_arr << num_divisors(num) 
    end
    return true if div_arr.max == div_arr[-1]
 return false
end

def num_divisors(n)
    count_div = 0
    (1...n).each do |num|
        if n % num == 0
            count_div += 1
        end
    end
    count_div
end

#matrix_addition
#Let a 2-dimensional array be known as a "matrix". Write a method matrix_addition that accepts two matrices as arguments. 
#The two matrices are guaranteed to have the same "height" and "width". The method should return a new matrix representing the sum of the two arguments.
#To add matrices, we simply add the values at the same positions:
#
## programmatically
#[[2, 5], [4, 7]] + [[9, 1], [3, 0]] => [[11, 6], [7, 7]]
#
## structurally
#2 5  +  9 1  =>  11 6
#4 7     3 0      7 7
#Examples
#
#matrix_a = [[2,5], [4,7]]
#matrix_b = [[9,1], [3,0]]
#matrix_c = [[-1,0], [0,-1]]
#matrix_d = [[2, -5], [7, 10], [0, 1]]
#matrix_e = [[0 , 0], [12, 4], [6,  3]]
#
#p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
#p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
#p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
#p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def matrix_addition(a1, a2)
    t = a1.zip(a2)
    t.map { |e1,e2| (e1.is_a? Array) ? matrix_addition(e1,e2) : e1+e2 }
end

#mutual_factors
#Write a method mutual_factors that accepts any amount of numbers as arguments. 
#The method should return an array containing all of the common divisors shared among the arguments. 
#For example, the common divisors of 50 and 30 are 1, 2, 5, 10. You can assume that all of the arguments are positive integers.
#
#Examples
#
#p mutual_factors(50, 30)            # [1, 2, 5, 10]
#p mutual_factors(50, 30, 45, 105)   # [1, 5]
#p mutual_factors(8, 4)              # [1, 2, 4]
#p mutual_factors(8, 4, 10)          # [1, 2]
#p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
#p mutual_factors(12, 24, 64)        # [1, 2, 4]
#p mutual_factors(22, 44)            # [1, 2, 11, 22]
#p mutual_factors(22, 44, 11)        # [1, 11]
#p mutual_factors(7)                 # [1, 7]
#p mutual_factors(7, 9)              # [1]

def mutual_factors(*nums)
    output = []
    nums.each do |num|
       output << find_factors(num)
    end
    output.reduce(:&)
end

def find_factors(n)
    output = []
    (1..n).each do |num|
        if n % num == 0
            output << num
        end
    end
    output
end

#tribonacci_number
#The tribonacci sequence is similar to that of Fibonacci. The first three numbers of the tribonacci sequence are 1, 1, and 2. 
#To generate the next number of the sequence, we take the sum of the previous three numbers. The first six numbers of tribonacci sequence are:
#
#1, 1, 2, 4, 7, 13, ... and so on
#Write a method tribonacci_number that accepts a number argument, n, and returns the n-th number of the tribonacci sequence.
#
#Examples
#
#p tribonacci_number(1)  # 1
#p tribonacci_number(2)  # 1
#p tribonacci_number(3)  # 2
#p tribonacci_number(4)  # 4
#p tribonacci_number(5)  # 7
#p tribonacci_number(6)  # 13
#p tribonacci_number(7)  # 24
#p tribonacci_number(11) # 274

def tribonacci_number(num)
   trib_arr = [1,1,2]
   while trib_arr.length < num
    trib_arr << trib_arr[-1] + trib_arr[-2] + trib_arr[-3]
   end
   trib_arr[-1]
end

#matrix_addition_reloaded
#Write a method matrix_addition_reloaded that accepts any number of matrices as arguments. 
#The method should return a new matrix representing the sum of the arguments. Matrix addition can only be performed on matrices of similar dimensions, 
#so if all of the given matrices do not have the same "height" and "width", then return nil.
#
#Examples
#
#matrix_a = [[2,5], [4,7]]
#matrix_b = [[9,1], [3,0]]
#matrix_c = [[-1,0], [0,-1]]
#matrix_d = [[2, -5], [7, 10], [0, 1]]
#matrix_e = [[0 , 0], [12, 4], [6,  3]]
#
#p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
#p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
#p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
#p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
#p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
#p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil
#squarocol?

  #-- could not figure this problem out on my own. 
def matrix_addition_reloaded(*matrices)
    matrix = matrices.first
    height = matrix.length
    width = matrix[0].length

    empty_matrix = Array.new(height) { [0] * width }
    matrices.inject(empty_matrix) do |m1, m2|
        return nil if m2.length != height or m2[0].length != width
        matrix_addition(m1, m2)
    end
end


#squarocol?
#Write a method squarocol? that accepts a 2-dimensional array as an argument. 
#The method should return a boolean indicating whether or not any row or column is completely filled with the same element. 
#You may assume that the 2-dimensional array has "square" dimensions, meaning it's height is the same as it's width.

#Examples

#p squarocol?([
    #[:a, :x , :d],
    #[:b, :x , :e],
    #[:c, :x , :f],
#]) # true
#
#p squarocol?([
    #[:x, :y, :x],
    #[:x, :z, :x],
    #[:o, :o, :o],
#]) # true
#
#p squarocol?([
    #[:o, :x , :o],
    #[:x, :o , :x],
    #[:o, :x , :o],
#]) # false
#
#p squarocol?([
    #[1, 2, 2, 7],
    #[1, 6, 6, 7],
    #[0, 5, 2, 7],
    #[4, 2, 9, 7],
#]) # true
#
#p squarocol?([
    #[1, 2, 2, 7],
    #[1, 6, 6, 0],
    #[0, 5, 2, 7],
    #[4, 2, 9, 7],
#]) # false

def squarocol?(arr)
    return true if arr.any? { |row| row.uniq.length == 1 }
    return true if arr.transpose.any? { |col| col.uniq.length == 1 }
    return false
end

def adjacent_sums(arr)
    sums = []
    (0...arr.length-1).each do |i|
        sums << arr[i] + arr[i + 1]
    end
    sums
end

def pascals_triangle(n)
    triangle = [[1]]
    while triangle.length < n
        level_above = triangle.last
        next_level = [1]
        next_level += adjacent_sums(level_above)
        next_level << 1
        triangle << next_level
    end
    triangle
end

def prime?(num)
    return  false if num < 2
    (2...num).none? { |i| num % i == 0 }
end

def mersenne_prime(n)
    x = -1
    count = 0
    while count < n
        x += 1
        candidate = 2**x - 1
        count += 1 if prime?(candidate)
    end
    2**x - 1
end

def triangular_sequence(n)
    seq = []
    i = 1
    while i <= n
        seq << (i * (i + 1)) / 2
        i += 1
    end
    seq
end

def triangular_word?(word)
    alpha = ('a'..'z').to_a
    value = word
        .split('')
        .map { |char| alpha.index(char) + 1 }
        .sum
    triangular_nums = triangular_sequence(value)
    triangular_nums.include?(value)
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false


def collapse(nums)
    (0...nums.length - 1).each do |i|
        if nums[i] + 1 == nums[i + 1] || nums[i] == nums[i + 1] + 1
            return nums[0...i] + nums[i + 2..-1]
        end
    end

    nums
end

def consecutive_collapse(numbers)
    numbers.each { numbers = collapse(numbers) }
    numbers
end

# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []


def next_prime(number, i)
    step = 1
    if i < 0
        i = -(i)
        step = -(step)
    end

    prime_count = 0
    while prime_count < i
        return nil if number < 0
        number += step
        prime_count += 1 if prime?(number)
    end
    number
end

def pretentious_primes(numbers, n)
    numbers.map { |num| next_prime(num, n) }
end