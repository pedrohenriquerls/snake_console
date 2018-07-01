require 'byebug'
require 'io/console'

require_relative 'screen_char'
require_relative 'snake'

HEIGHT, WIDTH = $stdout.winsize

def initialize_screen
  $empty_screen = ''
  0.upto(WIDTH * HEIGHT - 1) do |row_index|
    $empty_screen += ' '
  end
  $screen = $empty_screen.freeze.dup
end

initialize_screen

def update
  rand_x = rand(WIDTH - 1)
  rand_y = rand(HEIGHT - 1)
  ScreenChar.new(rand_x, rand_y, 'b').draw
end

def clear_screen
  $stdout.write(%x{clear})
  $stdout.rewind
  $screen = $empty_screen.dup
end

@snake = Snake.new

loop do
  clear_screen

  # execute the game logic
  @snake.update

  #Render the view
  $stdout.printf("\r%s", $screen)

  sleep 0.1
end

