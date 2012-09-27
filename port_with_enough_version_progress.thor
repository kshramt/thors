class PortWithEnoughVersionProgress < Thor
  default_task :start

  desc "start", "Returns port names which undergone enough version progress."
  def start
    raise "This script is not running on Mac." unless RUBY_PLATFORM =~ /darwin/

    puts `port outdated`.split("\n")\
      .select{|line| enough_progress?(line)}\
      .map{|line| line.split[0]}\
      .join("\t")
  end

  private

  def enough_progress?(line)
    (current_major_version, current_minor_version), (new_major_version, new_minor_version) = parse_line(line)
    current_major_version < new_major_version || current_minor_version < new_minor_version
  end

  def parse_line(line)
    name, current_version, lt, new_version = line.split
    [parse_version(current_version), parse_version(new_version)]
  end

  def parse_version(version)
    major, minor, debug = version.split(/\D/, 3)
    [major.to_i, minor.to_i]
  end
end
