require "pp"

module Tinge

  class CLI < Thor

    default_command :process

    method_option :reporter, aliases: %w(-r), default: 'variables', enum: Reporters.valid
    method_option :format,   aliases: %w(-f), default: 'json', enum: Formatters.valid
    method_option :output,   aliases: %w(-o), description: "Output to filename"

    desc "process [FILENAME, ...]", "Process text"
    def process(*filenames)
      result = Parser.parse(read(filenames))
      formatter = Formatters.find(options[:format])
      if formatter.require_filename? && !options[:output]
        abort "Must provide an output filename for format #{options[:format]}"
      end
      reporter  = Reporters.find(options[:reporter])
      formatter.new(reporter.new(result, formatter), options[:output]).render
    end

    private

    def read(filenames = [])
      if filenames.any?
        filenames.map { |f| File.read(f) }.join("\n")
      else
        STDIN.read
      end
    end

  end

end
