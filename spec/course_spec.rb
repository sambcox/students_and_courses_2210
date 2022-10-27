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
  end
end