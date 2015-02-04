require 'gosu'

class Game < Gosu::Window
  def initialize
    @width = 800
    @height = 400
    super @width, @height, false
  end

  def update
    puts 'hello'
  end

  def draw
  end
end

Game.new.show
