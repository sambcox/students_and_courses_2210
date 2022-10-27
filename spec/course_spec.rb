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
    it 'can tell if a class is full' do
      course = Course.new("Calculus", 2)

      expect(course.full?).to be false
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
end