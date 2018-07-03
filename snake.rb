require_relative 'screen_char'

class Snake
  RIGHT = 'move_right'.freeze
  LEFT = 'move_left'.freeze
  BOTTOM = 'move_bottom'.freeze
  UP = 'move_up'.freeze


  def initialize
    @body = default_body_position
    @direction = RIGHT
  end

  def update
    body.each(&:draw)
    movement
  end

  def eat?(food)
    snake_head = body.last
    if snake_head.x == food.x && snake_head.y == food.y
      body.insert(0, body.first.clone)
      true
    end
  end

  def change_direction(user_input)
    case user_input
    when "A"
      @direction = UP
    when "B"
      @direction = BOTTOM
    when "C"
      @direction = RIGHT
    when "D"
      @direction = LEFT
    end
  end

  private

  attr_reader :body, :direction

  def movement
    body.shift
    send(direction)
  end

  def move_up
    body << ScreenChar.new(body.last.x, body.last.y - 1)
  end

  def move_bottom
    body << ScreenChar.new(body.last.x, body.last.y + 1)
  end

  def move_right
    body << ScreenChar.new(body.last.x + 1, body.last.y)
  end

  def move_left
    body << ScreenChar.new(body.last.x - 1, body.last.y)
  end

  def default_body_position
    center_x = WIDTH / 2
    center_y = HEIGHT / 2
    0.upto(5).each_with_object([]) do |x, default_body|
      default_body << ScreenChar.new(center_x + x, center_y)
    end
  end
end
