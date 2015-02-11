class Ball
  def initialize(win)
    @win = win
    @x = @win.width/2
    @y = @win.height/2
    @angle = 0
    @image = Gosu::Image.new(@win, '../media/ball.png', false)
  end

  def draw
    @image.draw_rot(@x, @y, 0, @angle)
  end
end
