class Split < Thor
  trap :SIGPIPE, :EXIT

  default_task :split

  desc 'split', 'split lines by SEPARATOR'
  method_option :separator, required: true, aliases: "-s"
  method_option :joint, default: ' ', aliases: '-j'
  def split
    while line = $stdin.gets
      $stdout.puts line.split(options[:separator]).join(options[:joint])
    end
  end
end
