module StudentGrades
  class PathBuilder
    attr_accessor :class_name

    def self.path_for(class_name)
      new(class_name).path
    end

    def initialize(class_name)
      self.class_name = class_name
    end

    def path
      base = StudentGrades.grade_report_path
      File.join(base, grade_filename)
    end

    private

    def grade_filename
      base_name = File.basename(class_name, '.*')
      "#{base_name[0..-2]}_averages.txt"
    end
  end
end
