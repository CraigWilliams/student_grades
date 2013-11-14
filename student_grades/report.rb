module StudentGrades
  class Report
    attr_reader :data, :student_collection, :class_name

    def initialize(data_path)
      @data_path          = data_path
      @class_name         = data_path.basename
      @student_collection = StudentCollection.new
    end

    def build
      CSV.foreach(@data_path) do |row|
        name, *grades = row

        student = Student.new(name).tap do |student|
          grades.each { |grade| student.add(grade) }
        end

        student_collection.add student
      end

      self
    end

    def data
      [class_average, student_data].join("\n")
    end

    private

    def class_average
      student_collection.grade_average
    end

    def student_data
      student_collection.students.map do |student|
        [student.name, student.grade_average].join(',')
      end
    end
  end
end
