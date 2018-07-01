require_relative 'screen_char'

class Snake
  def initialize
    @body = default_body_position
  end

  def update
    body.each(&:draw)
    movement
  end

  private

  attr_reader :body

  def movement
    body.collect! do |chunk|
      chunk.x += 1
      chunk
    end
  end

  def default_body_position
    0.upto(5).each_with_object([]) do |x, default_body|
      default_body << ScreenChar.new(x, 0)
    end
  end
end
