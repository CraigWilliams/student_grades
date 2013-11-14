module StudentGrades
  class ReportWriter

    def initialize(data, output_path)
      @data        = data
      @output_path = output_path
    end

    def write
      ensure_directory

      File.open(@output_path, 'w') do |f|
        f.puts @data
      end
    end

    def ensure_directory
      dir = File.dirname @output_path
      unless File.exists? dir
        ::FileUtils.mkdir_p dir
      end
    end
  end
end
