require_relative "../player.rb"

module Players
  class Computer < Player
    @@corner_move = [1, 3, 7, 9].sample.to_s
    @@edge_move = [2, 4, 6, 8].sample.to_s
    @@random_move = (1..9).to_a.sample.to_s

    # check for move validity in this class to add additional computer intelligence
    # possibly initialize game in player class as well
    # include game as a move argument so you know which token you are
    # build moves if X or if O

    def move(board, game = Game.new)
      move = nil
      first_move(board, game)

      # check two methods below before moving forward for each additional turn
      block_win(board, game)
      secure_win(board, game)

      second_move(board, game)
      third_move(board, game)

      # failsafe conditional
      until board.valid_move?(move)
        move = @@random_move
      end
      move
      # binding.pry
    end
    
    # if you're token X
    def first_move(board, game)
      move = "1"
    end

    def second_move(board, game)
      if board.cells[1] == "O"
        move = "7"
      elsif board.cells[2] == "O"
        move = "4"
      elsif board.cells[3] == "O" || board.cells[8] == "O"
        move = "3"
      elsif board.cells[5] == "O" || board.cells[7] == "O"
        move = "5"
      elsif board.cells[6] == "O"
        move = "2"
      end
      move
    end

    def third_move(board, game)
      # "O" center move scenario is handled by win methods
      if board.cells[1] == "X" || board.cells[2] == "X" || board.cells[3] == "X" || board.cells[6] == "X"
        move = "5"
      elsif board.cells[4] == "X" && board.cells[5] == "O"
        move = "3"
      elsif board.cells[4] == "X" && board.cells[7] == "O"
        move = "7"
      end
      move
    end



    # if you're token O
    def first_move(board, game)
      board.cells[4] == "X" ? move = "1" : move = "5"
    end



    # method to block other player's possible win
    def block_win(board, game)
      Game::WIN_COMBINATIONS.find do |combo|
        
      end
    end

    # method to execute game-winning move
    def secure_win(board, game)
      Game::WIN_COMBINATIONS.find do |combo|

      end
    end


    # def move(board)
    #   # computer strategy
    #   move = nil
    #   if !board.taken?(5)
    #     # take center
    #     move = "5"
    #   elsif board.turn_count == 1
    #     # if center is taken, take upper left corner
    #     move = "1"
    #   elsif board.turn_count == 2
    #     # take corner to position yourself for a win
    #     move = @@corner_move
    #   elsif board.turn_count == 3 && board.position(1) == board.position(9) || board.position(3) == board.position(7)
    #     # block other player's possible win
    #     move = "2"
    #   else
    #     Game::WIN_COMBINATIONS.find do |combo|
    #       # try to win the game
    #       if combo.select{|i| board.position(i+1) == token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
    #         move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
    #       # If you can't win, block other player's possible win
    #       elsif combo.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
    #         move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
    #       end
    #     end
    #     if move == nil
    #       move = @@random_move
    #     end
    #   end
    #   move
    # end

    
  end
end