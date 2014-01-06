module Tinge
  module Reporters

    class MissingReporterError < RuntimeError; end

    def self.find(style)
      reporter = reporters[style.to_sym]
      if reporter
        reporter
      else
        raise MissingReporterError, style.to_s
      end
    end

    def self.valid
      reporters.keys.map(&:to_s)
    end

    def self.add(style, reporter)
      reporters[style.to_sym] = reporter
    end

    def self.reporters
      @reporters ||= {}
    end

    require "tinge/reporters/reporter"
    require "tinge/reporters/variables_reporter"
  end
end
