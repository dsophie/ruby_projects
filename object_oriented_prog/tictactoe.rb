# Create a command line run game of Tic Tac Toe where 2 players can play and the board is displayed between each turn

class Player
    attr_reader :color, :name

    # Gets the player name and color (cross or circle)
    def initialize
        puts "Enter your name"
        @name = gets.chomp
        puts "Choose between 'X' or 'O'"
        @color = gets.chomp
    end
end

class Game

    attr_accessor :board, :first, :second

    #Create 2 new players, create and display the game board
    def initialize
        @player1 = Player.new
        @player2 = Player.new

        create_board
        display_board

    end

    def create_board
        @grid = {
            '1' => ' ',
            '2' => ' ',
            '3' => ' ',
            '4' => ' ',
            '5' => ' ',
            '6' => ' ',
            '7' => ' ',
            '8' => ' ',
            '9' => ' '
            }
    end

    def display_board
        puts "Current game: "
        puts "#{@grid['1']} | #{@grid['2']} | #{@grid['3']}"
        puts "#{@grid['4']} | #{@grid['5']} | #{@grid['6']}"
        puts "#{@grid['7']} | #{@grid['8']} | #{@grid['9']}"
    end

    def play
        puts "Cross goes first so..."
        #Set first and second player
        if @player1.color == "X"
            @first = @player1
            @second = @player2
        elsif @player2.color == "X"
            @first = @player2
            @second = @player1
        else
            #If both player choose the same symbol
            puts "Hey, it looks like you both chose cross or circles, that won't work!"
        end

        #Indicate which player is first
        puts @first.name + " you're first"

        turns = 1
        while turns < 10
            #Make the alternate playing
            if turns % 2 != 0
                play_turn(@first)
            else
                play_turn(@second)
            end
            if check_victory == true #Each turn, check if a player won
                break
            end
            turns += 1
        end
    end

    #Simulate a player turn
    def play_turn(player)
        puts " "
        puts "It's "+ player.name + "'s turn!"
        puts "Where do you want to move?"
        cell = gets.chomp

        #If the board doesn't have the cell inputed
        if @grid.keys.include?(cell) == false
            puts " "
            puts "Invalid place, try again"
            play_turn(player)
        end
        #If cell is empty, put player color in it
        if @grid[cell] == ' '
            @grid[cell] = player.color
            #Else, this means a player already took the cell, puts error message
        else
            puts " "
            puts "Hum, looks like there's already something there, try again"
            play_turn(player)
        end
        display_board #Display board with new changes added
    end

    #Check if a player won, return true if he did
    def check_victory
        victory = false

        #check first line, first column and diagonal left to right
        if (@grid['1'] == "X" && @grid['2'] == "X" && @grid['3'] == "X")|| (@grid['1'] == "O" && @grid['2'] == "O" && @grid['3'] == "O")|| (@grid['1'] == "X" && @grid['4'] == "X" && @grid['7'] == "X")|| (@grid['1'] == "O" && @grid['4'] == "O" && @grid['7'] == "O")|| (@grid['1'] == "X" && @grid['5'] == "X" && @grid['9'] == "X")|| (@grid['1'] == "O" && @grid['5'] == "O" && @grid['9'] == "O")
            if @grid['1'] == "X"
                puts "The X won!"
                victory = true
            elsif @grid['1'] == "O"
                puts "The O won!"
                victory = true
            end
            #check second line, second column and diagonal right to left
        elsif (@grid['4'] == "X" && @grid['5'] == "X" && @grid['6'] == "X") || (@grid['4'] == "O" && @grid['5'] == "O" && @grid['6'] == "O") || (@grid['2'] == "X" && @grid['5'] == "X" && @grid['8'] == "X") || (@grid['2'] == "O" && @grid['5'] == "O" && @grid['8'] == "O") || (@grid['3'] == "X" && @grid['5'] == "X" && @grid['7'] == "X") || (@grid['3'] == "O" && @grid['5'] == "O" && @grid['7'] == "O")
            if @grid['5'] == "X"
                puts "The X won!"
                victory = true
            elsif @grid['5'] == "O"
                puts "The O won!"
                victory = true
            end
            #check last column and last line
        elsif (@grid['7'] == "X" && @grid['8'] == "X" && @grid['9'] == "X") || (@grid['7'] == "O" && @grid['8'] == "O" && @grid['9'] == "O") || (@grid['3'] == "X" && @grid['6'] == "X" && @grid['9'] == "X") || (@grid['3'] == "O" && @grid['6'] == "O" && @grid['9'] == "O")
            if @grid['9'] == "X"
                puts "The X won!"
                victory = true
            elsif @grid['9'] == "O"
                puts "The O won!"
                victory = true
            end
        end
    end
end
    letsplay = Game.new
    letsplay.play
