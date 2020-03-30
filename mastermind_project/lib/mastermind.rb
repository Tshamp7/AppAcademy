require_relative "code"

class Mastermind
 def initialize(length)
    @secret_code = Code.random(length)
 end

 def print_matches(code)
  puts "Number of exact matches: #{@secret_code.num_exact_matches(code)}"
  puts "Number of near matches: #{@secret_code.num_near_matches(code)}"
 end

 def ask_user_for_guess
    puts "Enter a code"
    input = Code.from_string(gets.chomp)
    self.print_matches(input)
    if input == @secret_code
        true
    else
        false
    end
 end


 
end
