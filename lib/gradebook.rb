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

  def students_grade_below(grade_input)
    all_students.find_all { |student| student.grade < grade_input}
  end

  def students_grade_in_range(grade_input_low, grade_input_high)
    all_students.find_all { |student| student.grade < grade_input_high && student.grade > grade_input_low}
  end
end