#no_dupes?
#Write a method no_dupes?(arr) that accepts an array as an arg and returns an new array containing the elements that were not repeated in the array.

# Examples
#no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
#no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
#no_dupes?([true, true, true])            # => []

def no_dupes?(arr)
    counts = Hash.new(0)
    arr.each do |ele|
        counts[ele] += 1
    end
 output = []
 counts.each do |k, v|
    if v == 1
        output << k
    end
 end
 output
end
 


#no_consecutive_repeats?
#Write a method no_consecutive_repeats?(arr) that accepts an array as an arg. The method should return true if an element never appears consecutively in the array; it should return false otherwise.

# Examples
#no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
#no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
#no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
#no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
#no_consecutive_repeats?(['x'])                              # => true
#char_indices


def no_consecutive_repeats?(arr)
    if arr.length == 1
        return true
    end

    arr.each_index do |i|
        if arr[i] == arr[i + 1]
            return false
        end
    end
    return true
end      


#char_indices
#Write a method char_indices(str) that takes in a string as an arg. The method should return a hash containing characters as keys. The value associated with each key should be an array containing the indices where that character is found.

# Examples
#char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
#char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}



def char_indices(str)
    counts = {}
    str.each_char do |ele|
        counts[ele] = str.chars.each_index.select { |i| str.chars[i] == ele }
    end
 counts
end

#longest_streak
#Write a method longest_streak(str) that accepts a string as an arg. The method should return the longest streak of consecutive characters in the string. 
#If there are any ties, return the streak that occurs later in the string.

# Examples
#longest_streak('a')           # => 'a'
#longest_streak('accccbbb')    # => 'cccc'
#longest_streak('aaaxyyyyyzz') # => 'yyyyy
#longest_streak('aaabbb')      # => 'bbb'
#longest_streak('abc')         # => 'c'

def longest_streak(str)
   current_streak = ""
   longest_streak = ""

   (0...str.length).each do |idx|
        if str[idx] == str[idx - 1] || idx == 0
            current_streak += str[idx]
        else
            current_streak = str[idx]
        end

        if current_streak.length >= longest_streak.length
            longest_streak = current_streak
        end
    end
    longest_streak
end

#bi_prime?
#Write a method bi_prime?(num) that accepts a number as an arg and returns a boolean indicating whether or not the number is a bi-prime. 
#A bi-prime is a positive integer that can be obtained by multiplying two prime numbers.

#For Example:

#14 is a bi-prime because 2 * 7
#22 is a bi-prime because 2 * 11
#25 is a bi-prime because 5 * 5
#24 is not a bi-prime because no two prime numbers have a product of 24
# Examples
#bi_prime?(14)   # => true
#bi_prime?(22)   # => true
#bi_prime?(25)   # => true
#bi_prime?(94)   # => true
#bi_prime?(24)   # => false
#bi_prime?(64)   # => false

def bi_prime?(num)
    prime_arr = []
    (2...num).each do |ele|
        if is_prime?(ele)
            prime_arr << ele
        end
    end

    prime_arr.each do |ele|
        prime_arr.each do |ele2|
            if ele * ele2 == num
                return true
            end
        end
    end
    return false
end


def is_prime?(num)
    if num <= 1
        return false
    elsif num == 2
        return true
    end

    (3...num).each do |ele|
        if num % ele == 0
            return false
        end
    end
    return true
end

#vigenere_cipher
#A Caesar cipher takes a word and encrypts it by offsetting each letter in the word by a fixed number,
# called the key. Given a key of 3, for example: a -> d, p -> s, and y -> b.

#A Vigenere Cipher is a Caesar cipher, but instead of a single key, a sequence of keys is used. For example, 
#if we encrypt "bananasinpajamas" with the key sequence 1, 2, 3, then the result would be "ccqbpdtkqqcmbodt":

# Message:  b a n a n a s i n p a j a m a s
# Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# Result:   c c q b p d t k q q c m b o d t
#Write a method vigenere_cipher(message, keys) that accepts a string and a key-sequence as args, 
#returning the encrypted message. Assume that the message consists of only lowercase alphabetic characters.

# Examples
#vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
#vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
#vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
#vigenere_cipher("zebra", [3, 0])            # => "ceerd"
#vigenere_cipher("yawn", [5, 1])             # => "dbbo"


def vigenere_cipher(word, key)
  word_arr = word.chars
  alpha_arr = "abcdefghijklmnopqrstuvwxyz"
  key_arr = make_key_arr(word, key)
  new_word = ""

    word_arr.each_with_index do |char, i|
        old_index = alpha_arr.index(char)
        new_index = (old_index + key_arr[i]) % 26 
        new_word += alpha_arr[new_index]
    end
 new_word
end

def make_key_arr(word, key)
 arr_length = word.length
 key_arr = []

 while key_arr.length < word.length
    key.each do |ele|
        key_arr << ele
    end
 end

 key_arr
end

#puts vigenere_cipher("toerrishuman", [1, 2, 3])   # => "uqhstltjxncq"
#puts vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
#puts vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
#puts vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
#puts vigenere_cipher("zebra", [3, 0])            # => "ceerd"
#puts vigenere_cipher("yawn", [5, 1])             # => "dbbo"

#vowel_rotate
#Write a method vowel_rotate(str) that accepts a string as an arg and returns the string where every vowel is replaced with the vowel the 
#appears before it sequentially in the original string. The first vowel of the string should be replaced with the last vowel.

# Examples
#vowel_rotate('computer')      # => "cempotur"
#vowel_rotate('oranges')       # => "erongas"
#vowel_rotate('headphones')    # => "heedphanos"
#vowel_rotate('bootcamp')      # => "baotcomp"
#vowel_rotate('awesome')       # => "ewasemo"


def vowel_rotate(str)
    new_str = str[0..-1]
    vowels = "aeiou"

    vowel_idxs = (0...str.length).select { |i| vowels.include?(str[i]) }
    rotated_idx = vowel_idxs.rotate(-1)
    
    vowel_idxs.each_with_index do |char, i|
        new_vowel = str[rotated_idx[i]]
        new_str[char] = new_vowel
    end
    
  new_str
end



#puts vowel_rotate('computer')      # => "cempotur"
#puts vowel_rotate('oranges')       # => "erongas"
#puts vowel_rotate('headphones')    # => "heedphanos"
#puts vowel_rotate('bootcamp')      # => "baotcomp"
#puts vowel_rotate('awesome')       # => "ewasemo"


#String#select
#Extend the string class by defining a String#select method that accepts a block. 
#The method should return a new string containing characters of the original string that return true when passed into the block. 
#If no block is passed, then return the empty string. Do not use the built-in Array#select in your solution.

# Examples
#"app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
#"HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
#"HELLOworld".select          # => ""

#String#map!
#Extend the string class by defining a String#map! method that accepts a block. 
#The method should modify the existing string by replacing every character with the result of calling the block, 
#passing in the original character and it's index. Do not use the built-in Array#map or Array#map! in your solution.

# Examples
#word_1 = "Lovelace"
#word_1.map! do |ch| 
   # if ch == 'e'
   #     '3'
   # elsif ch == 'a'
   #     '4'
  #  else
 #       ch
#    end
#end
#p word_1        # => "Lov3l4c3"

class String

    def select(&prc)
        new_str = ""

        if prc == nil
            new_str
        end

        self.each_char do |char|
            if prc.call(char) 
                new_str << char
            end
        end 
        new_str
    end

    def map!(&prc)

        self.each_char.with_index do |char, i|
            self[i] = prc.call(char)
        end

      return self
    end
end

word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end

#multiply
#Write a method multiply(a, b) that takes in two numbers and returns their product.

#You must solve this recursively (no loops!)
#You must not use the multiplication (*) operator
# Examples
#multiply(3, 5)        # => 15
#multiply(5, 3)        # => 15
#multiply(2, 4)        # => 8
#multiply(0, 10)       # => 0
#multiply(-3, -6)      # => 18
#multiply(3, -6)       # => -18
#multiply(-3, 6)       # => -18


def multiply(num_1,num_2)
    if num_2 == 0
        return 0
    end
    
    if num_2 < 0
        -(num_1 +  multiply(num_1, -(num_2) - 1))
    else
        num_1 +  multiply(num_1, num_2 - 1)
    end

end

#puts multiply(3, 5)        # => 15
#puts multiply(3, 5)        # => 15
#puts multiply(5, 3)        # => 15
#puts multiply(2, 4)        # => 8
#puts multiply(0, 10)       # => 0
#puts multiply(-3, -6)      # => 18
#puts multiply(3, -6)       # => -18
#puts multiply(-3, 6)       # => -18

#lucas_sequence
#The Lucas Sequence is a sequence of numbers. The first number of the sequence is 2. 
#The second number of the Lucas Sequence is 1. To generate the next number of the sequence, we add up the previous two numbers. 
#For example, the first six numbers of the sequence are: 2, 1, 3, 4, 7, 11, ...
#Write a method lucasSequence that accepts a number representing a length as an arg. 
#The method should return an array containing the Lucas Sequence up to the given length. Solve this recursively.

## Examples
#lucas_sequence(0)   # => []
#lucas_sequence(1)   # => [2]    
#lucas_sequence(2)   # => [2, 1]
#lucas_sequence(3)   # => [2, 1, 3]
#lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
#lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def lucas_sequence(n)

    if n == 0
        return []
    elsif n == 1
        return [2]
    elsif n == 2
        return [2,1]
    end

   seq = lucas_sequence(n - 1)
    seq << seq[-1] + seq[-2]
    seq
end
#lucas_sequence(0)   # => []
#lucas_sequence(1)   # => [2]    
#lucas_sequence(2)   # => [2, 1]
#lucas_sequence(3)   # => [2, 1, 3]
#lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
#lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

#prime_factorization
#The Fundamental Theorem of Arithmetic states that every positive integer is either a prime or can be represented as a product of prime numbers.
#
#Write a method prime_factorization(num) that accepts a number and returns an array representing the prime factorization of the given number. 
#This means that the array should contain only prime numbers that multiply together to the given num. 
#The array returned should contain numbers in ascending order. Do this recursively.
#
## Examples
#prime_factorization(12)     # => [2, 2, 3]
#prime_factorization(24)     # => [2, 2, 2, 3]
#prime_factorization(25)     # => [5, 5]
#prime_factorization(60)     # => [2, 2, 3, 5]
#prime_factorization(7)      # => [7]
#prime_factorization(11)     # => [11]
#prime_factorization(2017)   # => [2017]
   # I could not figure this one out on my own. 


   
def prime_factorization(num)
    (2...num).each do |fact|
        if (num % fact == 0)
            otherFact = num / fact
            return [ *prime_factorization(fact), *prime_factorization(otherFact) ]
        end
    end

    [num]
end