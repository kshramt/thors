class Split < Thor
  trap :SIGPIPE, :EXIT

  default_task :start

  desc 'split', 'split lines by SEPARATOR'
  method_option :separator, required: true, aliases: "-s"
  def start
    while line = $stdin.gets
      $stdout.puts line.split(options[:separator]).join(' ')
    end
  end
end
