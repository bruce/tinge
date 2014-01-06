require "pp"

module Tinge

  class CLI < Thor

    default_command :vars

    method_option :format,   aliases: %w(-f), default: 'scss', enum: Formatters.valid
    method_option :output,   aliases: %w(-o), description: "Output to filename"

    desc "vars [FILENAME, ...]", "Find and resolve color variable assignments in SCSS"
    def vars(*filenames)
      result = Parser.parse(read(filenames))
      formatter = Formatters.find(options[:format])
      if formatter.require_filename? && !options[:output]
        abort "Must provide an output filename for format #{options[:format]}"
      end
      reporter  = Reporters.find(:variables)
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
