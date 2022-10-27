require './lib/student'
require './lib/course'

RSpec.describe Course do
  describe '#initialize' do
    it 'exists' do
      course = Course.new("Calculus", 2)

      expect(course).to be_a(Course)
    end

    it 'has a name' do
      course = Course.new("Calculus", 2)

      expect(course.name).to eq("Calculus")
    end

    it 'has a capacity' do
      course = Course.new("Calculus", 2)

      expect(course.capacity).to eq(2)
    end

    it 'has no students by default' do
      course = Course.new("Calculus", 2)

      expect(course.students).to eq([])
    end
  end

  describe '#full?' do
    it 'can tell if a class is not full' do
      course = Course.new("Calculus", 2)

      expect(course.full?).to be false
    end

    it 'can tell if a class is full' do
      course = Course.new("Calculus", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})

      course.enroll(student1)
      course.enroll(student2)

      expect(course.full?).to be true
    end
  end

  describe 'enroll' do
    it 'can add students to the course' do
      course = Course.new("Calculus", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})

      course.enroll(student1)
      course.enroll(student2)

      expect(course.students).to eq([student1, student2])
    end
  end

  describe 'course_log_score' do
    it 'can add a score to course_scores' do
      course = Course.new("Calculus", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})

      course.course_log_score(student1, 78)
      course.course_log_score(student1, 82)
      course.course_log_score(student2, 75)
      course.course_log_score(student2, 79)

      expect(course.course_scores).to eq({student1 => [78, 82], student2 => [75,79]})
    end
  end
end