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
  end
end