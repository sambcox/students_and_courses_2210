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
end