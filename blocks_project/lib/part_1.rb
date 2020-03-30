def select_even_nums(arr)
 arr.select(&:even?)

end

def reject_puppies(dog_arr)
 dog_arr.reject { |h| h["age"] <= 2}

end

def count_positive_subarrays(arr)
 arr.count do |array|
  array.sum > 0
 end

end

def aba_translate(str)
  vowels = "aeiou"
  output = []

   str.each_char do |char|
     if vowels.include?(char)
       output << char + "b" + char
     else
       output << char 
     end
    end

 return output.join("")
end

def aba_array(arr)
 arr.map { |word| aba_translate(word)}

end