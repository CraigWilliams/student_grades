require 'spec_helper'

describe StudentGrades::PathBuilder do

  let(:class_name)              { 'class_1_grades.csv' }
  let(:class_grade_report_name) { class_grades_for("class_1_grade_averages.txt") }

  subject(:file_path) { StudentGrades::PathBuilder.path_for(class_name) }

  describe '.path_for' do
    it 'converts a class grade data filename into a class grade report filename' do
      expect(file_path).to eq(class_grade_report_name.to_s)
    end
  end

end
