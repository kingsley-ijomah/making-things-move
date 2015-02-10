require 'gosu'
require './ball'

class Game < Gosu::Window
  def initialize
    @w = 600
    @h = 500
    super @w, @h, false
    self.caption = 'Moving in Circle'
    @ball = Ball.new(self)
  end

  def update
    @ball.move
  end

  def draw
    @ball.draw
  end
end

Game.new.show
