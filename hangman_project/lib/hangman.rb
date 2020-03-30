class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
   DICTIONARY.sample
  end
 
  def initialize
   @secret_word = Hangman.random_word
   @guess_word = Array.new(@secret_word.length, "_")
   @attempted_chars = []
   @remaining_incorrect_guesses = 5
  end
 
  def guess_word
   @guess_word
  end

  def attempted_chars
   @attempted_chars
  end

  def remaining_incorrect_guesses
   @remaining_incorrect_guesses
  end
 
  def already_attempted?(char)
   if @attempted_chars.include?(char)
    return true
   else
    return false
   end
  end

  def get_matching_indices(char)
    arr = @secret_word.chars
   (0..arr.length).select { |i| arr[i] == char }
  end

 def fill_indices(char, arr)
   arr.each do |ele|
    @guess_word[ele] = char
   end
 end
 
 def try_guess(char)
  fill_indices(char, get_matching_indices(char))
  @remaining_incorrect_guesses -= 1 if get_matching_indices(char).length == 0
  if already_attempted?(char) == true
    print "that has already been attempted"
    return false
  else
    @attempted_chars << char
    return true
  end
 end

 def ask_user_for_guess
  
  print "Enter a char:"
   guess = gets.chomp
   return try_guess(guess)

 end
 
 def win?
  if @guess_word.join("") == @secret_word
    puts "WIN"
    return true
  elsif @guess_word.join("") != @secret_word
    return false
  end
 end

 def lose?
  if @remaining_incorrect_guesses == 0
    puts "LOSE"
    return true
  elsif @remaining_incorrect_guesses != 0
    return false
  end
 end

 def game_over?
  if win?() == true || lose? == true
    puts "The secret word was #{@secret_word}!"
    return true
  else
    return false
  end

 end




end
