require './lib/student'
require './lib/course'
require './lib/gradebook'

RSpec.describe Gradebook do
  describe '#initialize' do
    it 'exists' do
      gradebook = Gradebook.new("Nathan")

      expect(gradebook).to be_a(Gradebook)
    end
  end
end