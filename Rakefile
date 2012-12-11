require 'yaml'
CONFIG = YAML.load_file File.join(ENV['HOME'], '.config', 'command', 'config.yaml')

task :default do
  `ls *.thor`.split.each{|thor_file|
    sh "#{CONFIG[:thor]} install #{thor_file} --force --as #{thor_file}"
  }
end
