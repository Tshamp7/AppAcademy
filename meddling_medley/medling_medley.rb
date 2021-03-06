#duos
#Write a method duos that accepts a string as an argument and returns the count of the number of times the same 
#character appears consecutively in the given string.
#
#Examples
#
#p duos('bootcamp')      # 1
#p duos('wxxyzz')        # 2
#p duos('hoooraay')      # 3
#p duos('dinosaurs')     # 0
#p duos('e')             # 0

def duos(str)
    letters = str.split("")

    count = 0

    letters.each.with_index do |letter, i|
       count += 1 if letter == str[i + 1]
    end
    count
end

#sentence_swap
#Write a method sentence_swap that accepts a sentence and a hash as arguments. 
#The method should return a new sentence where every word is replaced with it's corresponding value in the hash. 
#If a word does not exist as a key of the hash, then it should remain unchanged.
#
#Examples
#
#p sentence_swap('anything you can do I can do',
    #'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
#) # 'nothing you shall drink I shall drink'
#
#p sentence_swap('what a sad ad',
    #'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
#) # 'make a happy ad'
#
#p sentence_swap('keep coding okay',
    #'coding'=>'running', 'kay'=>'pen'
#) # 'keep running okay'

def sentence_swap(sentence, hash)
    words = sentence.split(" ")
    output = []
    words.each do |word|
        if hash.has_key?(word)
            output << hash[word]
        else
            output << word
        end
    end
    output.join(" ")
end

#hash_mapped
#Write a method hash_mapped that accepts a hash, a proc, and a block. 
#The method should return a new hash where each key is the result of the original key when given to the block. 
#Each value of the new hash should be the result of the original values when passed into the proc.
#
#Examples
#
#double = Proc.new { |n| n * 2 }
#p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
## {"A!!"=>8, "X!!"=>14, "C!!"=>-6}
#
#first = Proc.new { |a| a[0] }
#p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
## {25=>"q", 36=>"w"}

def hash_mapped(hash, block, &prc)
    output = {}

    hash.each_pair do |key, value|
        output[prc.call(key)] = block.call(value)
    end
    output
end


#counted_characters
#Write a method counted_characters that accepts a string as an argument. 
#The method should return an array containing the characters of the string that appeared more than twice. 
#The characters in the output array should appear in the same order they occur in the input string.
#
#Examples
#
#p counted_characters("that's alright folks") # ["t"]
#p counted_characters("mississippi") # ["i", "s"]
#p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
#p counted_characters("runtime") # []

def counted_characters(str)
    output = []
    str.each_char do |char|
        if str.count(char) > 2 && !output.include?(char)
            output << char
        end
    end
    output
end

#triplet_true?
#Write a method triplet_true? that accepts a string as an argument and returns a boolean indicating whether or not the string contains three 
#of the same character consecutively.
#
#Examples
#
#p triplet_true('caaabb')        # true
#p triplet_true('terrrrrible')   # true
#p triplet_true('runninggg')     # true
#p triplet_true('bootcamp')      # false
#p triplet_true('e')             # false

def triplet_true(str)
    str.chars.each_with_index do |letter, i|
        return true if letter == str[i + 1] && letter == str[i + 2]
    end
    false
end

#energetic_encoding
#Write a method energetic_encoding that accepts a string and a hash as arguments. 
#The method should return a new string where characters of the original string are replaced with the corresponding values in the hash. 
#If a character is not a key of the hash, then it should be replaced with a question mark ('?'). Space characters (' ') should remain unchanged.
#
#Examples
#
#p energetic_encoding('sent sea',
    #'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
#) # 'zimp ziu'
#
#p energetic_encoding('cat',
    #'a'=>'o', 'c'=>'k'
#) # 'ko?'
#
#p energetic_encoding('hello world',
    #'o'=>'i', 'l'=>'r', 'e'=>'a'
#) # '?arri ?i?r?'
#
#p energetic_encoding('bike', {}) # '????'

def energetic_encoding(str, hash)
    new_str = ""

    str.chars.each_with_index do |letter, i|
        new_str += " " if letter == " "
       if hash.has_key?(letter)
            new_str += hash[letter] 
       else
            new_str += "?"  
       end
    end
    new_str
end

#uncompress
#Write a method uncompress that accepts a string as an argument. 
#The string will be formatted so every letter is followed by a number. The method should return an "uncompressed" version of the 
#string where every letter is repeated multiple times given based on the number that appears directly after the letter.
#
#Examples
#
#uncompress('a2b4c1') # 'aabbbbc'
#uncompress('b1o2t1') # 'boot'
#uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def uncompress(str)
    new_str = ""
        str.each_char.with_index do |letter, i|
            if i.odd?
                letter.to_i.times do 
                    new_str += str[i - 1]
                end
            end
        end
    new_str
end

#conjunct_select
#Write a method conjunct_select that accepts an array and one or more procs as arguments. 
#The method should return a new array containing the elements that return true when passed into all of the given procs.
#
#Examples
#
#is_positive = Proc.new { |n| n > 0 }
#is_odd = Proc.new { |n| n.odd? }
#less_than_ten = Proc.new { |n| n < 10 }
#
#p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
#p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
#p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def conjunct_select(arr, *prcs)
    output = []
        arr.each do |ele|
            if prcs.all? { |prc| prc.call(ele) }
                output << ele
            end
        end
    output
end

#convert_pig_latin
#Write a method convert_pig_latin that accepts a sentence as an argument. The method should translate the sentence according to the following rules:
#
#words that are shorter than 3 characters are unchanged
#words that are 3 characters or longer are translated according to the following rules:
#if the word begins with a vowel, simply add 'yay' to the end of the word (example: 'eat'->'eatyay')
#if the word begins with a non-vowel, move all letters that come before the word's first vowel to the end of the word and add 'ay' (example: 'trash'->'ashtray')
#Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.
#
#Examples
#p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
#p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
#p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
#p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
#p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def convert_pig_latin(sentence)
    words = sentence.split(" ")
    output = []
    vowels = "aeiou"

    words.each do |word|
        if word.length < 3 
            output << word
        elsif vowels.include?(word[0])
            output << word + "yay"
        elsif !vowels.include?(word[0])
            output << non_vowel(word)
        end
    end

    output = output.map { |word| uppercase(word) }
  
    output.join(" ")
end

def non_vowel(word)
    vowels = "aeiou"
    new_word = ""
    (1...word.length).each do |i|
        if vowels.include?(word[i])
            new_word += word[i..-1] + word[0...i] + "ay"
            break
        end
    end
    new_word
end

def uppercase(word)
    letters = word.split("")
    letters.each do |letter|
        uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        if uppercase.include?(letter)
        return word.capitalize
        end
    end
    return word
end
 

#reverberate
#Write a method reverberate that accepts a sentence as an argument. The method should translate the sentence according to the following rules:
#
#words that are shorter than 3 characters are unchanged
#words that are 3 characters or longer are translated according to the following rules:
#if the word ends with a vowel, simply repeat the word twice (example: 'like'->'likelike')
#if the word ends with a non-vowel, repeat all letters that come after the word's last vowel, including the last vowel itself (example: 'trash'->'trashash')
#Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.
#
#Examples
#p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
#p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
#p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
#p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def reverberate(sentence)
    words = sentence.split(" ")
    output = []
    vowels = "aeiou"

    words.each do |word|
        if word.length < 3
            output << word
        elsif vowels.include?(word[-1])
            output << word + word
        elsif !vowels.include?(word[-1])
            output << last_not_vowel(word)
        end
    end
    output = output.map { |word| uppercase(word) }
    output.join(" ")
end

def last_not_vowel(word)
    vowels = "aeiou"
    new_word = ""

    letters = word.reverse.split("")

    letters.each_with_index do |letter, i|
        if vowels.include?(letter)
            new_word += letters[0..i].join("") + letters.join("") 
            break
        end
    end
    new_word.reverse
end

#disjunct_select
#Write a method disjunct_select that accepts an array and one or more procs as arguments. 
#The method should return a new array containing the elements that return true when passed into at least one of the given procs.
#
#Examples
#
#longer_four = Proc.new { |s| s.length > 4 }
#contains_o = Proc.new { |s| s.include?('o') }
#starts_a = Proc.new { |s| s[0] == 'a' }
#
#p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    #longer_four,
#) # ["apple", "teeming"]
#
#p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    #longer_four,
    #contains_o
#) # ["dog", "apple", "teeming", "boot"]
#
#p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    #longer_four,
    #contains_o,
    #starts_a
#) # ["ace", "dog", "apple", "teeming", "boot"]

def disjunct_select(arr, *procs)
    output = []
    procs.each do |proc|
        arr.each do |ele|
            if proc.call(ele)
                output << ele if !output.include?(ele)
            end
        end
    end
    output
end

#alternating_vowel
#Write a method alternating_vowel that accepts a sentence as an argument. 
#The method should return a new sentence where the words alternate between having their first or last vowel removed. For example:
#
#the 1st word should be missing its first vowel
#the 2nd word should be missing its last vowel
#the 3rd word should be missing its first vowel
#the 4th word should be missing its last vowel
#... and so on
#Note that words that contain no vowels should remain unchanged. Vowels are the letters a, e, i, o, u.
#
#Examples

#p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
#p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
#p alternating_vowel('code properly please') # "cde proprly plase"
#p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def alternating_vowel(sentence)
    words = sentence.split(" ")
    output = []

    words.each_with_index do |word, i|
        output << remove_first(word) if i.even?
        output << remove_last(word) if i.odd?
    end

    output.join(" ")
end

def remove_first(word)
    vowels = "aeiou"
    letters = word.split("")

    letters.each_with_index do |letter, i|
        if vowels.include?(letter)
            letters.delete_at(i)
            break
        end
    end
    letters.join("")
end


def remove_last(word)
    vowels = "aeiou"
    letters = word.reverse.split("")

    letters.each_with_index do |letter, i|
        if vowels.include?(letter)
            letters.delete_at(i)
            break
        end
    end

    letters.reverse.join("")
end

#silly_talk
#Write a method silly_talk that accepts a sentence as an argument. The method should translate each word of the sentence according to the following rules:
#
#if the word ends with a vowel, simply repeat that vowel at the end of the word (example: 'code'->'codee')
#if the word ends with a non-vowel, every vowel of the word should be followed by 'b' and that same vowel (example: 'siren'->'sibireben')
#Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.
#
#Examples
#
#p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
#p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
#p silly_talk('They can code') # "Thebey caban codee"
#p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def silly_talk(sentence)
    words = sentence.split(" ")
    vowels = "aeiou"
    output = []

    words.each do |word|
        if vowels.include?(word[-1])
          output << word + word[-1]
        elsif !vowels.include?(word[-1])   
            output << vowel_add_b(word)
        else
            output << word
        end
    end 
    output.join(" ")
end


def vowel_add_b(word)
    vowels = "aeiou"
    letters = word.split("")
    output = ""

    letters.each do |letter|
        if vowels.include?(letter)
            output += letter + "b" + letter
        else
            output += letter
        end
    end
    output
end


#compress
#Write a method compress that accepts a string as an argument. 
#The method should return a "compressed" version of the string where streaks of consecutive letters are translated to a single appearance 
#of the letter followed by the number of times it appears in the streak. If a letter does not form a streak (meaning that it appears alone), 
#then do not add a number after it.
#
#Examples
#
#p compress('aabbbbc')   # "a2b4c"
#p compress('boot')      # "bo2t"
#p compress('xxxyxxzzzz')# "x3yx2z4"


def compress(str)
    letters = str.split("")
    counts = Hash.new(0)
    output = ""

    letters.each do |letter|
        counts[letter] += 1
    end

    counts.each do |k, v|
        output += k
        if v > 1
            output += v.to_s
        end
    end
    output
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"