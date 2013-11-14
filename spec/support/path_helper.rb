module PathHelper

  def class_data_for(file_name)
    path = File.join(StudentGrades.class_scores_path, file_name)
    Pathname.new(path)
  end

  def class_grades_for(file_name)
    path = File.join(StudentGrades.grade_report_path, file_name)
    Pathname.new(path)
  end

end
