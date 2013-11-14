require 'spec_helper'
require 'tempfile'

describe StudentGrades::ReportWriter do

  let(:output_path) { class_grades_for('class_2_grade_averages.txt') }
  let(:data)        { "88\nJimmy Jimms,77\nFranky Franks,22\n" }

  subject(:writer) { StudentGrades::ReportWriter.new(data, output_path) }

  describe '#write' do
    it 'writes the contents to file' do
      writer.write

      expect(File.read(output_path)).to eq(data)
    end
  end

end
