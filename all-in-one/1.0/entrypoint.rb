#!/usr/bin/env ruby

module MUNS
  class Entrypoint
    def salute
      puts '=' * 50
      puts ' ███╗   ███╗ ██╗     ██╗ ███╗    ██╗ ██████████╗'
      puts ' ████╗ ████║ ██║     ██║ ████╗   ██║ ██╔═══════╝'
      puts ' ██╔████╔██║ ██║     ██║ ██╔██╗  ██║ ██████████╗'
      puts ' ██║╚██╔╝██║ ██║     ██║ ██║ ╚██╗██║ ╚═══════██║'
      puts ' ██║ ╚═╝ ██║ ╚████████╔╝ ██║   ╚███║ ██████████║'
      puts ' ╚═╝     ╚═╝  ╚═══════╝  ╚═╝    ╚══╝ ╚═════════╝'
      puts ''
      puts " #{colorize('MongoDB', :green)} + #{colorize('Unicorn', :magenta)} + #{colorize('Nginx', :green)} + #{colorize('Sinatra', :red)}"
      puts '=' * 50
    end
    
    def print_version
      system('ruby --version')
      system('mongo --version')
      system('unicorn -v')
      system('nginx -v')
      system('gem list sinatra | grep "^sinatra\s.*"')
    end
    
    def run_daemon
      exec('while true; do sleep 3600; done')
    end
    
    def colorize(text, color)
      case color
      when :black
        color_code = 30
      when :red
        color_code = 31
      when :green
        color_code = 32
      when :yellow
        color_code = 33
      when :blue
        color_code = 34
      when :magenta
        color_code = 35
      when :cyan
        color_code = 36
      when :white
        color_code = 37
      else
        return text
      end
      "\e[#{color_code}m#{text}\e[0m"
    end
    
    private :colorize
  end
end

entrypoint = MUNS::Entrypoint.new
entrypoint.salute
entrypoint.print_version

if ARGV.empty?
  entrypoint.run_daemon
else
  exec(ARGV.join(' '))
end
