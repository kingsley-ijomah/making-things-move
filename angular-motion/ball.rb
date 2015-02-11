class Ball
  def initialize(win)
    @win = win
    @x = @win.width/2 
    @y = @win.height/2
    @angle = 360
    @speed = 1
    @image = Gosu::Image.new(@win, '../media/ball.png', false)
  end

  def draw
    @image.draw_rot(@x, @y, 0, 0)
  end

  def move
    radian = @angle * Math::PI / 180
    @x += Math.cos(radian) * @speed
    @y += Math.sin(radian) * @speed
  end
end
