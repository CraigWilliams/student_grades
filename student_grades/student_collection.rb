module StudentGrades
  class StudentCollection
    attr_accessor :students

    def initialize
      self.students = []
    end

    def add(student)
      self.students << student
    end

    def grade_average
      students.map(&:grade_average).reduce(&:+) / @students.size
    end

  end
end
