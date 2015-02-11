require 'gosu'
require './ball'

class Game < Gosu::Window
  def initialize
    super 600, 500, false
    @ball = Ball.new(self)
  end

  def update
  end

  def draw
    @ball.draw
  end
end

Game.new.show
