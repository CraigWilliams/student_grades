require 'spec_helper'

describe StudentGrades::Report do

  let(:csv_data_path) { class_data_for('class_1_grades.csv') }

  subject(:report) { StudentGrades::Report.new(csv_data_path) }

  before { report.build }

  describe '#build' do

    it 'returns self' do
      expect(report.build).to be_instance_of(StudentGrades::Report)
    end

    it 'creates students from a csv file' do
      collection = report.student_collection

      expect(collection.students.count).to eq(3)
    end
  end

  describe '#data' do
    let(:expected_data) { "83\nSprocket Jones,80\nSammy Sam,81\nGunther Reagan,89" }

    it 'prepares course grade data' do
      expect(report.data).to eq(expected_data)
    end
  end
end
