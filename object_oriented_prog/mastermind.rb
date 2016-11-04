class Game

    #Create 2 boards: a grid for the player guesses and a result grid for the combinaison
    def create_board
        @result = {
            '1' => ' ',
            '2' => ' ',
            '3' => ' ',
            '4' => ' '
            }

        @grid = {
            '1' => ' ',
            '2' => ' ',
            '3' => ' ',
            '4' => ' '
            }
    end

    #Display the board game, either with the guesses of the player so far or the end result
    def display_board(choice)

        if choice == "result"
            puts "Solution: "
            puts "#{@result['1']} | #{@result['2']} | #{@result['3']} | #{@result['4']}"
        elsif choice == "game"
            puts "Game in progress: "
            puts "#{@grid['1']} | #{@grid['2']} | #{@grid['3']} | #{@grid['4']}"
        end
    end

    #Randomize a combinaison of four colors
    def randomize

        @result.each do |key, value|
            random = rand(16)
            if random <= 4
                @result[key] = "B"
            elsif random > 4 && random <= 8
                @result[key] = "G"
            elsif random > 9 && random <= 12
                @result[key] = "R"
            elsif random < 13
                @result[key] = "Y"
            end
        end
    end

    #Starter if the player wants to guess a combinaison randomly selected by the compyter
    def start_random
        create_board
        randomize

        puts "Welcome to the Mastermind game!"
        puts "You're playing against the computer, so try to guess the combinaison, you have 12 guesses"
        puts " "

        display_board("game")

        turns = 1
        while turns < 13
            puts "Choose where to put the colors: R, B, Y, G"
            4.times do 
                #Get user guesses
                cas = gets.chomp
                if @grid.keys.include?(cas) == false 
                    puts "Error try again"
                    start_random
                else
                    cell = gets.chomp
                    @grid[cas] = cell
                end
            end
            display_board("game")
            if check_victory == true
                break
            end

            #Comparison guess with result
            if @grid['1'] == @result['1']||@grid['2'] == @result['2']|| @grid['3'] == @result['3']||@grid['4'] == @result['4']
                puts "You have one guess right!"
            elsif (@grid['1'] == @result['1'] && @grid['2'] == @result['2']) || (@grid['3'] == @result['3'] && @grid['4'] == @result['4']) || (@grid['2'] == @result['2'] && @grid['4'] == @result['4']) || (@grid['1'] == @result['1'] && @grid['4'] == @result['4']) || (@grid['3'] == @result['3'] && @grid['2'] == @result['2'])
                puts "You have two guesses right!"        
            else
                puts "Oh... you don't have any right"
            end
            puts "Give up?"
            give_up = gets.chomp
            #If the user wants to give up, display the solution
            if give_up == "yes"
                display_board("result")
                break
            else
                puts "Yeah, lets keep going!"
            end
        end
    end

    #Starter if the player wants to build the solution and let the computer play (the computer playing algorithm no yet created)
    def start_choose
        create_board

        puts "Welcome to the Mastermind game!"
        puts "Create your combinaison and make the computer guess!"
        puts " "

        display_board("game")
        puts "Choose where to put the colors: R, B, Y, G"
        4.times do 
            cas = gets.chomp
            cell = gets.chomp
            @result[cas] = cell
        end
        display_board("result")

        computer_guess

    end

    def check_victory
        victory = false

        if @grid == @result
            victory = true
        else
            victory = false
        end

        return victory
    end

end

letsplay = Game.new
letsplay.start_random