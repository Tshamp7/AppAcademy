def all_words_capitalized?(arr)
 arr.all? { |word| word == word.capitalize }

end

def no_valid_url?(arr)
 valid_endings = [".com",".net",".iq",".org"]


 arr.none? do |word|
  valid_endings.any? { |ending| word.end_with?(ending) }
 end

end 

def any_passing_students?(arr)

 arr.any? do |hash|
   if hash[:grades].inject { |sum, el| sum + el }.to_f / hash[:grades].size >= 75
    return true
   end
 
 end
 return false
end 

