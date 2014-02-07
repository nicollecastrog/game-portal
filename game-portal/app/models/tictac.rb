class Tictac < ActiveRecord::Base
  belongs_to :game
  belongs_to :player1, class_name: 'User'
  belongs_to :player2, class_name: 'User'
  has_many :moves

  accepts_nested_attributes_for :moves

  attr_accessible :game_id, :player1_id, :player2_id, :name, :result, :moves_attributes

  before_validation :set_default_result
  before_validation :set_game_id



  def make_move(square, player)
    raise "you're not one of the players on this game" unless [player1_id, player2_id].include?(player.id)
    raise "it's not your turn" unless whose_turn == player.id
    raise "that space is occupied" if square_occupied?(square)
    raise "game is finished" if game_over?

    raise "that's not a valid square" unless square_is_in_bounds?(square)
    
    Move.create tictac_id: self.id, player_id: player.id, square: square, symbol: which_symbol

  end #closes make_move




  def moves_made_array
    moves_made_array = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
    moves.each do |move|
      moves_made_array[move.square] = move.symbol
    end
    return moves_made_array
  end

  def square_occupied?(square)
    if moves_made_array[square] == nil
      return false
    else
      return true
    end
  end

  def whose_turn
    if moves.count.even?
      return player1_id
    else
      return player2_id
    end
  end

  def who_just_played
    if moves.count.even?
      return player2_id
    else
      return player1_id
    end
  end

  def game_over?
    if check_rows? || check_columns? || check_diagonals?
      winner = User.find(who_just_played)
      winner.increment!(:score, by = 3)
      self.result = "#{winner.id}"
      self.update_attributes(:result => "#{winner.id}")
      return true
    elsif check_full_board?
      p1 = User.find(player1_id)
      p1.increment!(:score, by = 1)
      p2 = User.find(player2_id)
      p2.increment!(:score, by = 1)
      self.result = "tie"
      self.update_attributes(:result => "tie")
      return true
    else
      return false
    end
  end

  def update_score
    if game_over?
    else
    end
  end




  private
  def set_default_result
    self.result ||= :still_active
  end

  private
  def set_game_id
    self.game_id = 2
  end

  private
  def which_symbol
    moves.count.even? ? 'X' : 'O'
  end


  private
  def check_rows?
    i = 0
    while i < 9 do
        if (moves_made_array[i] != nil && moves_made_array[i] == moves_made_array[(i+1)] && moves_made_array[i] == moves_made_array[(i+2)])
          return true
        else
          i += 3
        end
    end
    return false
  end
      
  private
  def check_columns?
      for i in 0...3
          if (moves_made_array[i] != nil && moves_made_array[i] == moves_made_array[(i+3)] && moves_made_array[i] == moves_made_array[(i+6)])
            return true
          else
            i += 2
          end
      end
      return false
  end

  private
  def check_diagonals?  
    if (moves_made_array[0] != nil && moves_made_array[0] == moves_made_array[4] && moves_made_array[0] == moves_made_array[8])
      return true
    elsif (moves_made_array[2] != nil && moves_made_array[2] == moves_made_array[4] && moves_made_array[2] == moves_made_array[6])
      return true
    end
    return false
  end

  private
  def check_full_board?  
    i = 0
    while i < 9 do
      if moves_made_array[i] == nil
        return false
      else
        i += 1     
      end
    end
    return true
  end 

  private
  def square_is_in_bounds?(square)
    if square >= 0 && square < 9
      return true
    else
      return false
    end
  end

end # closes TicTac class model
