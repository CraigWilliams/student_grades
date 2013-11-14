require 'spec_helper'

describe StudentGrades::Student do

  subject(:student) { StudentGrades::Student.new }

  describe '#add' do
    it 'adds a grade to a student' do
      student.add '85'
      student.add '76'

      expect(student.grades).to eq([85,76])
    end
  end

  describe '#grade_average' do
    it 'averages the students grades' do
      student.grades = [88,92,65,99]

      expect(student.grade_average).to eq(86)
    end
  end
end
