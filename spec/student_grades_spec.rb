require 'spec_helper'

describe StudentGrades do

  after { FileUtils.rm_rf(StudentGrades.grade_report_path) }

  describe '.report_for' do
    let(:path)          { File.join(StudentGrades.class_scores_path, 'class_1_grades.csv') }
    let(:class1_grades) { File.join(StudentGrades.grade_report_path, 'class_1_grade_averages.txt') }

    let(:single_class_path)      { Pathname.new(path) }
    let(:expected_class1_grades) { "83\nSprocket Jones,80\nSammy Sam,81\nGunther Reagan,89\n" }

    it 'builds a single grade report' do
      StudentGrades.report_for(single_class_path)

      expect(File.read(class1_grades)).to eq(expected_class1_grades)
    end
  end

  describe '.all_reports' do
    let(:class2_grades) { File.join(StudentGrades.grade_report_path, 'class_2_grade_averages.txt') }

    it 'creates a report for each class data file' do
      StudentGrades.all_reports

      expect(File.exists?(class2_grades)).to be_true
    end
  end
end
