class Student
  attr_reader :scores
  def initialize(info_input)
    @student_info = info_input
    @scores = []
  end

  def name
    @student_info[:name]
  end

  def age
    @student_info[:age]
  end

  def log_score(score)
    scores << score
  end
end