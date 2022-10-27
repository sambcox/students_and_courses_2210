require './lib/student'
require './lib/course'

RSpec.describe Course do
  describe '#initialize' do
    it 'exists' do
      course = Course.new("Calculus", 2)
    end
  end
end