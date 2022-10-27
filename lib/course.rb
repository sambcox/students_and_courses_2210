class Course
  attr_reader :name, :capacity
  def initialize(course_name, capacity)
    @name = course_name
    @capacity = capacity
  end
end