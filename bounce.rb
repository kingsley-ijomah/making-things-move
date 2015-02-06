require 'gosu'

class Ball
  def initialize(win)
    @w = 50
    @h = 50
    @radius = @w/2
    @win = win
    @x = rand(@radius..win.width-@radius)
    @y = rand(@radius..@win.height-@radius)
    @vx = 20
    @vy = 20
    @paused = false
    @image = Gosu::Image.new(win, 'media/ball.png', true)
  end

  def draw
    @image.draw_rot(@x, @y, 0, 0)
  end

  def pause
    @vx_paused = @vx
    @vy_paused = @vy
    @vx = 0
    @vy = 0
    @paused = true
  end

  def un_pause
    @vx = @vx_paused
    @vy = @vy_paused
    @paused = false
  end

  def toggle_pause
    if @paused
      un_pause
    else
      pause
    end
  end

  def move
    collision_detect
    @x += @vx
    @y += @vy
  end

  def collision_detect
    if hit_right_wall
     horizontal_bounce 
    end

    if hit_left_wall
      horizontal_bounce 
    end

    if hit_bottom_wall
      vertical_bounce
    end

    if hit_top_wall
      vertical_bounce
    end
  end


  def horizontal_bounce
    @vx *= -1
  end

  def vertical_bounce
    @vy *= -1
  end

  def hit_left_wall
    @x <= @radius
  end

  def hit_right_wall
    @x >= @win.width-@radius
  end

  def hit_bottom_wall
    @y >= @win.height-@radius
  end

  def hit_top_wall
    @y <= @radius
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

  def button_down(id)
    if id == Gosu::KbSpace
      @ball.toggle_pause
    end

    if id == Gosu::KbEscape
      close
    end
  end
end

Game.new.show
