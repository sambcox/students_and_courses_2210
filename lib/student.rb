class Student
  def initialize(info_input)
    @student_info = info_input
  end

  def name
    @student_info[:name]
  end

  def age
    @student_info[:age]
  end
end