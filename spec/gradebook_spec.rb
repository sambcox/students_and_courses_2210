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
end