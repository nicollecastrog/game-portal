class Tictac < ActiveRecord::Base
  belongs_to :game
  belongs_to :player1, class_name: 'User'
  belongs_to :player2, class_name: 'User'
  has_many :moves

  accepts_nested_attributes_for :moves

  attr_accessible :game_id, :player1_id, :player2_id, :name, :result, :moves_attributes

  before_validation :set_default_result
  before_validation :set_game_id

  private
  def set_default_result
    self.result ||= :still_active
  end

  private
  def set_game_id
    self.game_id = 2
  end


end
