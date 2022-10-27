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
  end
end