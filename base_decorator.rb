require './nameable'

class Basedecorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    puts 'base called'
    @nameable.correct_name
  end
end
