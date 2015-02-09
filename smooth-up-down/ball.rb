class Ball
  def initialize(win)
    @win = win
    @w = 50
    @h = 50
    @x = @win.w/2
    @y = @win.h/2
    @centerY = @win.h/2
    @angle = 0
    @range = 275
    @image = Gosu::Image.new(@win, '../media/ball.png', false)
  end

  def draw
    @image.draw_rot(@x, @y, 0, 0)
  end

  def bounce
    @y = @centerY + Math.sin(@angle) * @range
    @angle += 0.05
  end
end
