require './lib/student'
require './lib/course'
require './lib/gradebook'

RSpec.describe Gradebook do
  describe '#initialize' do
    it 'exists' do
      gradebook = Gradebook.new("Nathan")

      expect(gradebook).to be_a(Gradebook)
    end

    it 'has an instructor' do
      gradebook = Gradebook.new("Nathan")

      expect(gradebook.instructor).to eq("Nathan")
    end

    it 'has no courses by default' do
      gradebook = Gradebook.new("Nathan")

      expect(gradebook.courses).to eq([])
    end
  end

  describe '#add_course' do
    it 'can add a course to the gradebook' do
      gradebook = Gradebook.new("Nathan")
      course1 = Course.new("Calculus", 2)
      course2 = Course.new("History", 4)
      gradebook.add_course(course1)
      gradebook.add_course(course2)

      expect(gradebook.courses).to eq(["Calculus", "History"])
    end
  end

  describe '#all_students' do
    it 'can list all students in the gradebook' do
      gradebook = Gradebook.new("Nathan")
      course1 = Course.new("Calculus", 2)
      course2 = Course.new("History", 4)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      student3 = Student.new({name: "Megan", age: 27})
      student4 = Student.new({name: "Sierra", age: 27})
      gradebook.add_course(course1)
      gradebook.add_course(course2)
      course1.enroll(student1)
      course1.enroll(student2)
      course2.enroll(student3)
      course2.enroll(student4)

      expect(gradebook.all_students).to eq([student1, student2, student3, student4])
    end
  end

  describe '#students_grade_below' do
    it 'can list all students in the gradebook with a grade below a certain number' do
      gradebook = Gradebook.new("Nathan")
      course1 = Course.new("Calculus", 2)
      course2 = Course.new("History", 4)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      student3 = Student.new({name: "Megan", age: 27})
      student4 = Student.new({name: "Sierra", age: 27})
      
      student1.log_score(54)
      student1.log_score(62)
      student1.log_score(48)
      student2.log_score(61)
      student2.log_score(65)
      student2.log_score(58)
      student3.log_score(85)
      student3.log_score(87)
      student3.log_score(98)
      student4.log_score(81)
      student4.log_score(86)
      student4.log_score(88)
      gradebook.add_course(course1)
      gradebook.add_course(course2)
      course1.enroll(student1)
      course1.enroll(student2)
      course2.enroll(student3)
      course2.enroll(student4)

      expect(gradebook.students_grade_below(70)).to eq([student1, student2])
    end
  end

  describe '#students_grade_in_range' do
    it 'can list all students in the gradebook with a grade within a specific range' do
      gradebook = Gradebook.new("Nathan")
      course1 = Course.new("Calculus", 2)
      course2 = Course.new("History", 4)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      student3 = Student.new({name: "Megan", age: 27})
      student4 = Student.new({name: "Sierra", age: 27})
      
      student1.log_score(54)
      student1.log_score(62)
      student1.log_score(48)
      student2.log_score(71)
      student2.log_score(78)
      student2.log_score(76)
      student3.log_score(85)
      student3.log_score(87)
      student3.log_score(98)
      student4.log_score(81)
      student4.log_score(86)
      student4.log_score(88)
      gradebook.add_course(course1)
      gradebook.add_course(course2)
      course1.enroll(student1)
      course1.enroll(student2)
      course2.enroll(student3)
      course2.enroll(student4)

      expect(gradebook.students_grade_in_range(70, 80)).to eq([student2])
    end
  end

  describe '#add_grade_course' do
    it 'can add grade specific to a course to the gradebook' do
      gradebook = Gradebook.new("Nathan")
      course1 = Course.new("Calculus", 2)
      course2 = Course.new("History", 4)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      student3 = Student.new({name: "Megan", age: 27})
      student4 = Student.new({name: "Sierra", age: 27})
      
      course1.enroll(student1)
      course1.enroll(student2)
      course2.enroll(student1)
      course2.enroll(student2)
      course2.enroll(student3)
      course2.enroll(student4)
      course1.course_log_score(student1, 78)
      course1.course_log_score(student1, 82)
      course1.course_log_score(student2, 75)
      course1.course_log_score(student2, 79)
      course2.course_log_score(student1, 54)
      course2.course_log_score(student1, 58)
      course2.course_log_score(student2, 65)
      course2.course_log_score(student2, 68)
      course2.course_log_score(student3, 81)
      course2.course_log_score(student3, 85)
      course2.course_log_score(student4, 88)
      course2.course_log_score(student4, 90)
      gradebook.add_course(course1)
      gradebook.add_course(course2)
      gradebook.add_grade_course

      expect(gradebook.course_specific_grades).to eq({course1 => {student1 => [78, 82], student2 => [75,79]}, course2 => {student1 => [54, 58], student2 => [65,68], student3 => [81, 85], student4 => [88, 90]}})
    end
  end
end