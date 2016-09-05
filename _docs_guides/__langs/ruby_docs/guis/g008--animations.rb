def shoes_app
  Shoes.app do
    def draw_arena margin_all_sides, arena_width
      @line = line(margin_all_sides, margin_all_sides, 
                   margin_all_sides + arena_width, margin_all_sides)
      @line = line(margin_all_sides, margin_all_sides,
                   margin_all_sides, margin_all_sides + arena_width)
      @line = line(margin_all_sides, margin_all_sides + arena_width,
                   margin_all_sides + arena_width, margin_all_sides + arena_width)
      @line = line(margin_all_sides + arena_width, margin_all_sides,
                   margin_all_sides + arena_width, margin_all_sides + arena_width)
    end

    @arena_width = 200
    @margin_all_sides = 10
    @block = rect(left: @margin_all_sides, top: @margin_all_sides, width: 20)
    draw_arena(@margin_all_sides, @arena_width)

    keypress do |k|
      if k == :up && @block.top > 0
        @block.top += -10
      elsif k == :down
        @block.top += 10
      elsif k == :left
        @block.left += -10
      elsif k == :right
        @block.left += 10
      end
    end
  end
end

shoes_app