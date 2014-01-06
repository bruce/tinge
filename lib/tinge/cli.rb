require "pp"

module Tinge

  class CLI < Thor

    default_command :process

    method_option :format, aliases: %w(-f), default: 'ruby'

    desc "process FILENAME_OR_STDIN", "Process text"
    def process(filename = nil)
      result = Parser.parse(read(filename))
      case options['format']
      when 'ruby'
        p result
      end
    end

    desc "tree FILENAME_OR_STDIN", "Display the parse tree"
    def tree(filename = nil)
      pp Parser.new(read(filename)).document
    end

    private

    def read(filename = nil)
      if filename
        File.read(filename)
      else
        STDIN.read
      end
    end

  end

end
