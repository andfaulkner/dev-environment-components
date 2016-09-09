def draw_arena
  @line = line(margin_all_sides, margin_all_sides, 
               margin_all_sides + arena_width, margin_all_sides)
  @line = line(margin_all_sides, margin_all_sides,
               margin_all_sides, margin_all_sides + arena_width)
  @line = line(margin_all_sides, margin_all_sides + arena_width,
               margin_all_sides + arena_width, margin_all_sides + arena_width)
  @line = line(margin_all_sides + arena_width, margin_all_sides,
               margin_all_sides + arena_width, margin_all_sides + arena_width)
end
