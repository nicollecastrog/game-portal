class Game < ActiveRecord::Base
  attr_accessible :name
  has_many :tictacs
end
