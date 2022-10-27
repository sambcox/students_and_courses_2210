class Course
  attr_reader :name, :capacity, :students, :course_scores
  def initialize(course_name, capacity)
    @name = course_name
    @capacity = capacity
    @students = []
    @course_scores = {}
  end

  def full?
    students.length >= capacity
  end

  def enroll(student)
    students << student
  end

  def course_log_score(student, score)
    student.log_score(score)
    if @course_scores.keys.include?(student)
      @course_scores[student] << score
    else
      @course_scores[student] = [score]
    end
  end
end