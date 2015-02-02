require 'gosu'

class Ball
	attr_accessor :x, :y, :vy, :dropping

	def initialize(window)
		@window = window
		@width = 50
		@height = 50
		@image = Gosu::Image.new(@window, 'media/ball.png', true)
		@x = @window.stage_width / 2
		@y = @window.stage_height / 2
		@vy = 1
		@dropping = true
	end

	def draw
		@image.draw_rot(@x, @y, 0, 0)
	end

	def bounce
		@y -= @vy
	end

	def drop
		@y += @vy
	end

	def move
		if @dropping
			drop
		else
			bounce
		end
	end
end

class Game < Gosu::Window
	attr_reader :stage_width, :stage_height

	def initialize
		@stage_width = 800
		@stage_height = 600
		super @stage_width, @stage_height, false
		@ball = Ball.new(self)
		@start = false
	end

	def update
		if @start
			@ball.move
		end

		if @ball.y >= @stage_height then
			@ball.dropping = false
		end
	end

	def draw
		@ball.draw
	end

	def button_down(id)
		if id == Gosu::KbEscape then
			close
		end

		if id == Gosu::KbSpace then
			@start = true
		end
	end
end

Game.new.show