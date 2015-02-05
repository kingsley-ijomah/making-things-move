require 'gosu'

class Ball
  def initialize(win)
    @w = 50
    @h = 50
    @radius = @w/2
    @win = win
    @x = rand(@radius..win.width-@radius)
    @y = rand(@radius..@win.height-@radius)
    @speed = 4
    @image = Gosu::Image.new(win, 'media/ball.png', true)
  end

  def draw
    @image.draw_rot(@x, @y, 0, 0)
  end

  def move
    if hit_right_wall
      bounce
    end

    if hit_left_wall
      bounce
    end
    @x += @speed
  end

  def bounce
    @speed *= -1
  end

  def hit_left_wall
    @x <= @radius
  end

  def hit_right_wall
    @x >= @win.width-@radius
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
