class Student
  def initialize(info_input)
    @student_info = info_input
  end

  def name
    @student_info[:name]
  end
end