class ScreenChar
  attr_accessor :y,:x

  def initialize(x, y, char = '█')
    @x = x
    @y = y
    @char = char
  end

  def draw
    screen_index = y * WIDTH + x
    $screen[screen_index] = char
  end

  private

  attr_reader :char
end
