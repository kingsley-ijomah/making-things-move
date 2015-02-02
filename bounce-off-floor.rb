require 'gosu'

class Ball
	attr_accessor :x, :y, :vy, :dropping, :w, :h

	def initialize(window)
		@window = window
		@w = 50
		@h = 50
		@image = Gosu::Image.new(@window, 'media/ball.png', true)
		@x = @window.stage_width / 2
		@y = @window.stage_height / 2
		@vy = 3
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

	def detect_collision
		if @y >= (@window.stage_height - @h/2) then
			@dropping = false
		end

		if @y <= (@h/2) then
			@dropping = true
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
			@ball.detect_collision
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