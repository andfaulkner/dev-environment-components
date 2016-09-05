# -*- coding: utf-8 -*-

class Project
	NULL = Object.new.freeze
	BORDERS = %w(⎣ ⎦ ⎤ ⎡ ⎥ ⎢)
	SYMBOLS = %w(⌬ ⏚ ╳ X █ ▣ ▦)
	SPACES = %w(‧ . ▱ ▵ ▴ ▿)

	def initialize
		@start_position = 0
		@space = "◦"
		@marker = "X"
	end

	def position x, y
		@x, @y = x, y
	end

	def name(val = NULL)
		if val.equal?(NULL)
			@name
		else
			@name = sanitize val
		end
	end

	def dimensions length, width
		@length, @width = length, width
	end

	def draw
		puts "=" * 50
		if @name
			name_len = @name.to_s.size
			puts ""
			puts "-" * 50
			puts @name.to_s.center 50
			puts "-" * 50
			remove_instance_variable(:@name)
		end

		puts ""
		(@length-1).times{ |i|
			if i == @y
				puts "#{@space * @x}#{@marker}#{@space * (@width - @x - 1)}".rjust(@width + 2)
			else
				puts (@space * (@width)).rjust(@width + 2)
			end
		}
		puts ""
	end

	private

	def sanitize str
		str.gsub(/\s+/, '-').downcase
	end
end