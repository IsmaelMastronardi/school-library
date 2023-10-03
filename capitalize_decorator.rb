require './base_decorator.rb'

class CapitalizeDecorator < Basedecorator
  def correct_name 
    @nameable.correct_name.upcase
  end
end