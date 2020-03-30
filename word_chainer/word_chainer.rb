class Wordchainer
    attr_accessor :dictionary, :filename, :all_seen_words, :current_word
    def initialize(filename)
        @dictionary = {}
        @filename = filename
        File.readlines(filename).each_with_index do |word, i|
            @dictionary[word.chomp] = 1
        end
        @current_word = []
        @all_seen_words = {}
    end

    def adjacent_words(find_word)
        output = []
        find_word_letters = find_word.chars
        @dictionary.each_key do |word|
            if word.length == find_word_letters.length
                output << word
            end
        end

        adjacent_words = []

        output.each do |word|
            count = 0
            word.each_char.with_index do |char, idx|
                find_word_letters.each_with_index do |char2, idx2|
                    if idx == idx2
                        if char == char2
                            count += 1
                        end
                    end 
                end 
            end
            if count == (word.length - 1)
                adjacent_words << word if !adjacent_words.include?(word)    
            end
        end
        adjacent_words
    end

    def run(source, target)
        @current_words, @all_seen_words = [source], { source => nil }
    
        until @current_words.empty? || @all_seen_words.include?(target)
          explore_current_words
        end
    
        build_path(target)
    end

    def explore_current_words
        new_current_words = []
        @current_words.each do |current_word|
          adjacent_words(current_word).each do |adjacent_word|
            next if @all_seen_words.key?(adjacent_word)
    
            new_current_words << adjacent_word
            @all_seen_words[adjacent_word] = current_word
          end
        end
    
        @current_words = new_current_words
    end

    def build_path(target)
        path = []
        current_word = target
        until current_word.nil?
          path << current_word
          current_word = @all_seen_words[current_word]
        end
    
        path.reverse
    end


   

end

my_dictionary = Wordchainer.new("dictionary.txt")

p my_dictionary.run("draw", "holy")
