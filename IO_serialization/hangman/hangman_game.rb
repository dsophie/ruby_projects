#Implementation of Hangman game on the command line

class Word
    
    #computer uploads the dictionnary file and choose a random word
    def choose_random
        choices = File.readlines "5desk.txt"
        choices_list = []
        choices.each do |word|
            if word.length <= 12 && word.length >= 5
                choices_list << word
            end
        end

        total = choices_list.length
        choice = choices_list[1 + rand(total)].downcase
        return choice
    end
end

class Main
    
    attr_accessor :word_hash, :guess_array

    def initialize
        start_message
        
        @word_hash = {}
        @guess_array = []
        word = Word.new
        choice = word.choose_random
                
        alphabet = 'a'...'z'
        
        #store the letters in a hash
        choice.split("").each do |letter|
            if alphabet.include?(letter) == true
                letter_found = false
                @word_hash.store(letter, letter_found)
            end
        end
                
        play_turn(choice)
    end

    def start_message
        puts "Welcome to the HANGman!"
        puts "***"
        puts "Guess the word the computer choose, you have 9 guesses"
        
    end

    def play_turn(word)
        stop = 0
        while stop == 0
            incorrect_guesses = 0 + incorrect_guesses.to_i
            display(incorrect_guesses) #display game
            puts " "
            puts "Enter the letter for your guess"
            guess = gets.chomp
            if word.include?(guess) == true #check if guess is correct
                puts "Right guess :)"
                @word_hash[guess] = true #change value in hash to true
            else #if guess incorrect
                puts "Wrong guess :("
                incorrect_guesses += 1
                guess_array << guess #add guess to an array
            end
            stop = check_status(incorrect_guesses)
        end
    end
    
    def display(incorrect_guesses)
        puts "You already used #{incorrect_guesses} incorrect guesses out of 9"
            
        #print display of word
        @word_hash.each do |key, value|
            if value == false
                print " _ "
            elsif value == true
                print key
            end
        end
        
        puts " "
        print "Letters you tried so far: "
        @guess_array.each do |try|
            print try
            print ", "
        end
        
    end
    
    def check_status(guesses)
    
        count = 0
        @word_hash.each do |key, value|
            if value == true
                count += 1
            end
        end
        
        if guesses == 9 #if the player attainted the max number of guesses
            return_value = 1
            puts "Oh, looks like you don't have any guess left, too bad"
            puts "Bye bye"
        elsif count == @word_hash.length #if the player guessed all the letters
            return_value = 1
            display(guesses)
            puts " "
            puts "Hey, you won, congrats!"
            puts "Bye bye"
        else
            return_value = 0
        end
        
        return return_value
    end

    
end

go = Main.new


