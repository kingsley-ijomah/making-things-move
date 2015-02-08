class Ball
  def initialize(win)
    @win = win
    @w = 50
    @h = 50
    @x = @win.w/2
    @y = @win.h/2
    @image = Gosu::Image.new(@win, '../media/ball.png', false)
  end

  def draw
    @image.draw_rot(@x, @y, 0, 0)
  end
end
