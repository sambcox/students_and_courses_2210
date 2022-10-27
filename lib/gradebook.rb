class Gradebook
  attr_reader :instructor
  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def courses
    @courses.map { |course| course.name}
  end

  def add_course(course)
    @courses << course
  end
end