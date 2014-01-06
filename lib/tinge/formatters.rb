module Tinge
  module Formatters

    class MissingFormatterError < RuntimeError; end

    def self.find(format)
      formatter = formatters[format.to_sym]
      if formatter
        formatter
      else
        raise MissingFormatterError, format.to_s
      end
    end

    def self.valid
      formatters.keys.map(&:to_s)
    end

    def self.add(format, formatter)
      formatters[format.to_sym] = formatter
    end

    def self.formatters
      @formatters ||= {}
    end

    require "tinge/formatters/formatter"
    require "tinge/formatters/ase_formatter"
    require "tinge/formatters/json_formatter"
    require "tinge/formatters/ruby_formatter"
    require "tinge/formatters/scss_formatter"
    require "tinge/formatters/yaml_formatter"
  end
end
