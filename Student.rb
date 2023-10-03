# frozen_string_literal: true

class Student < Person
  def initialize(classroom, age, name = 'unknown', parent_permission = true, classroom)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    puts '¯\\(ツ)/¯'
  end
end
