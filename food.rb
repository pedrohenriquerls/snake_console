require 'forwardable'
require_relative 'screen_char'

class Food
  extend Forwardable
  def_delegators :@body, :x, :y

  def initialize
    spawn
  end

  def update
    body.draw
  end

  def spawn
    coord_y = rand(HEIGHT)
    coord_x = rand(WIDTH)
    @body = ScreenChar.new(coord_x, coord_y, '%')
  end

  alias respawn spawn

  private

  attr_reader :body
end
