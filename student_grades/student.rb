module StudentGrades
  class Student
    attr_accessor :name, :grades

    def initialize(name = '')
      self.name = name
      self.grades = []
    end

    def add(grade)
      self.grades << grade.to_i
    end

    def grade_average
      grades.reduce(:+) / grades.size
    end

  end
end
