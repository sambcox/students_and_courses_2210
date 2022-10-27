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

  def all_students
    @courses.map { |course| course.students}.flatten
  end
end