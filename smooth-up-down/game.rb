require 'gosu'
require './ball'

class Game < Gosu::Window
  attr_reader :w, :h

  def initialize
    @w = 600
    @h = 600
    super @w, @h, false
    self.caption = 'Smooth up and down'
    @ball = Ball.new(self)
  end

  def update
    @ball.bounce
  end

  def draw
    @ball.draw
  end
end

game = Game.new
game.show
