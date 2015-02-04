require 'gosu'

class Ball
  def initialize(win)
    @w = 50
    @h = 50
    @x = 200
    @y = 200
    @speed = 1
    @image = Gosu::Image.new(win, 'media/ball.png', true)
  end

  def draw
    @image.draw_rot(@x, @y, 0, 0)
  end

  def move
    @x += @speed
  end
end

class Game < Gosu::Window
  def initialize
    @width = 800
    @height = 400
    super @width, @height, false
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
