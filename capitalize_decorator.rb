require './base_decorator'

class CapitalizeDecorator < Basedecorator
  def correct_name
    @nameable.correct_name.upcase
  end
end
