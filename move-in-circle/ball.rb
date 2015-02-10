class Ball
  def initialize(window)
    @win = window
    @centerX = 300
    @centerY = 250
    @x = @centerX
    @y = @centerY
    @angle = 0
    @radius = 100
    @image = Gosu::Image.new(@win, '../media/ball.png', false)
  end

  def draw
    @image.draw_rot(@x, @y, 0, 0)
  end

  def move
    @x = @centerX + Math.cos(@angle) * @radius
    @y = @centerY + Math.sin(@angle) * @radius
    @angle += 0.1
  end
    
end
