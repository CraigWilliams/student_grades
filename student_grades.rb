require 'csv'
require 'pathname'
require 'fileutils'

require_relative 'student_grades/report'
require_relative 'student_grades/report_writer'
require_relative 'student_grades/student'
require_relative 'student_grades/student_collection'
require_relative 'student_grades/path_builder'

module StudentGrades

  @class_scores_path = File.join(Dir.pwd, 'classes')
  @grade_report_path = File.join(@class_scores_path, 'grades')

  class << self
    attr_accessor :class_scores_path, :grade_report_path
  end

  def self.all_reports
    Pathname.new(@class_scores_path).each_child do |path|
      next if path.basename.to_s.match(/^\./) || path.directory?
      report_for(path)
    end
  end

  def self.report_for(path)
    report      = Report.new(path).build
    output_path = PathBuilder.path_for(report.class_name)

    ReportWriter.new(report.data, output_path).write
  end

end

if __FILE__ == $0
  puts "Building all reports"
  StudentGrades.all_reports
  system("open #{StudentGrades.grade_report_path}")
end
