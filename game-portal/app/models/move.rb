class Move < ActiveRecord::Base
  attr_accessible :tictac_id, :player_id, :square, :symbol

  belongs_to :player, class_name: 'User'
  belongs_to :tictac

  
end