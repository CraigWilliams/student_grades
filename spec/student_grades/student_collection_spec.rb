require 'spec_helper'

describe StudentGrades::StudentCollection do

  let(:students) { [ double(grade_average: 88) ] }
  subject(:student_collection) { StudentGrades::StudentCollection.new }

  before { student_collection.students = students }

  describe '#add' do

    let(:new_student) { double(grade_average: 78) }
    let(:expected_students) { students.push new_student }

    it 'adds a student to the collection' do
      student_collection.add new_student

      expect(student_collection.students).to eq(expected_students)
    end
  end

  describe '#grade_average' do

    it 'averages all the students grades for the course' do
      expect(student_collection.grade_average).to eq(88)
    end
  end
end
