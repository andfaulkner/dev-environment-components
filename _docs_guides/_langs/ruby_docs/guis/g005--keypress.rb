Shoes.app do
  @info = para "NO KEY IS PRESSED"

  keypress do |k|
    @info.replace "#{k.inspect} was pressed"
    if k == :up
      alert "up!"
    elsif k == :down
      alert "do!"
    elsif k == :left
      alert "left!"
    elsif k == :right
      alert "right!"
    end
  end
end