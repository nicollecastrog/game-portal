class Tictac < ActiveRecord::Base
  belongs_to :game
  attr_accessible :game_id, :player1, :player2, :result, :sq0, :sq1, :sq2, :sq3, :sq4, :sq5, :sq6, :sq7, :sq8
end
