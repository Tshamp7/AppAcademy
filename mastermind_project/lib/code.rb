class Code
  attr_reader :pegs
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

 def self.valid_pegs?(arr)
  arr.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
 end

 def self.random(length)
   count = length
   output = []
   while count > 0
    output << POSSIBLE_PEGS.keys[rand(0..3)]
    count -= 1
   end
   Code.new(output)
 end

 def self.from_string(string)
  Code.new(string.chars)
 end

 def initialize(str_arr)
  @pegs = []

  if Code.valid_pegs?(str_arr)
    str_arr.each do |char|
      @pegs << char.upcase 
    end
  else
    exception
  end
 end
 def [](index)
   @pegs[index]
 end

 def length
  @pegs.length
 end

 def num_exact_matches(guess_code)
  num_correct = 0
   @pegs.each_index do |i|
      if guess_code[i] == @pegs[i]
        num_correct += 1
      end
   end
   num_correct
 end
 
 def num_near_matches(guess_code)
   count = 0
    @pegs.each_index do |i|
     if @pegs.include?(guess_code[i]) && guess_code[i] != @pegs[i]
      count +=1
    end
  end
  count
 end

 def ==(guess_code)
  guess_code == @pegs
 end
end
