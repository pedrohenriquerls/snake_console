require_relative 'screen_char'

class Food
  def initialize
    spawn
  end

  def update
    body.draw
  end

  private

  attr_reader :body

  def spawn
    return unless body.nil?
    coord_y = rand(HEIGHT)
    coord_x = rand(WIDTH)
    @body = ScreenChar.new(coord_x, coord_y, '%')
  end
end
