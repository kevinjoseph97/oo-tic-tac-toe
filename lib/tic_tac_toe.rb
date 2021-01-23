class TicTacToe

    def initialize
        @board = Array.new(9, " ")
    end

    WIN_COMBINATIONS = [ 
     [0,1,2],
     [3,4,5],
     [6,7,8],
     [0,3,6],
     [1,4,7],
     [2,5,8],
     [0,4,8],
     [2,4,6]
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
        
    end


    def input_to_index(user_input)              #take a input and change it into an integer and =1 so it can be placed on the board
        user_input.to_i-1
    end

    def move(index, player = "X")
        @board[index] = player 
    end

    def position_taken?(index)
        @board[index] == "X" || @board[index] ==  "O"
    end

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
        @board.count {|p| p == "X" || p == "O"}
    end

    def current_player
        if turn_count.even?
            return "X"
        else
            "O"
        end 
 
    end

    def turn 
        user_input = gets.strip
        index = input_to_index(user_input)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end
    end

    def won? 
        WIN_COMBINATIONS.detect do |combo|  
            @board[combo[0]] == @board[combo[1]] && 
            @board[combo[1]] == @board[combo[2]] && 
            position_taken?(combo[0])
        end
    end

    def full?
        @board.all?{|p| p == "X"|| p == "O"}
    end

    def draw?
        full? && !won?
    end
    
    def over?
        won? || draw?
    end
    
    def winner
        if combo = won?
          @board[combo[0]]
        end
    end
    
    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end
end 
