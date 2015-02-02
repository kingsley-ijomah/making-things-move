require 'gosu'

class Ball
	def initialize(window)
		@window = window
		@width = 50
		@height = 50
		@image = Gosu::Image.new(@window, 'media/ball.png', true)
		@ball_x = @window.stage_width / 2
		@ball_y = @window.stage_height / 2
	end

	def draw
		@image.draw_rot(@ball_x, @ball_y, 0, 0)
	end
end

class Game < Gosu::Window
	attr_reader :stage_width, :stage_height

	def initialize
		@stage_width = 800
		@stage_height = 600
		super @stage_width, @stage_height, false
		@ball = Ball.new(self)
	end

	def update
	end

	def draw
		@ball.draw
	end
end

Game.new.show