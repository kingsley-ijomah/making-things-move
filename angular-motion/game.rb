require 'gosu'

class Game < Gosu::Window
  def initialize
    @w = 600
    @h = 500
    super @w, @h, false
  end

  def update
  end

  def draw
  end
end

Game.new.show
