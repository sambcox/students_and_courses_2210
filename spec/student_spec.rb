require './lib/student'

RSpec.describe Student do
  describe '#initialize' do
    it 'exists' do
      student = Student.new({name: "Morgan", age: 21})    
      
      expect(student).to be_a(Student)
    end

    it 'has a name' do
      student = Student.new({name: "Morgan", age: 21})    
      
      expect(student.name).to eq("Morgan")
    end

    it 'has an age' do
      student = Student.new({name: "Morgan", age: 21})    
      
      expect(student.age).to eq(21)
    end

    it 'has no scores by default' do
      student = Student.new({name: "Morgan", age: 21})

      expect(student.scores).to eq([])
    end
  end

  describe '#log_score' do
    it 'can add scores' do
      student = Student.new({name: "Morgan", age: 21})
      student.log_score(89)
      student.log_score(78)

      expect(student.scores).to eq([89, 78])
    end
  end

  describe '#grade' do
    it 'can calculate an average grade' do
      student = Student.new({name: "Morgan", age: 21})
      student.log_score(89)
      student.log_score(78)

      expect(student.grade).to eq(83.5)
    end
  end
end