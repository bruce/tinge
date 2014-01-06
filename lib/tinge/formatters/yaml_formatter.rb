module Tinge
  module Formatters

    class YamlFormatter < Formatter

      handles :yaml, :yml

      dependency 'yaml'

      def render
        output YAML.dump(Hash[@reporter.data.sort])
      end

    end

  end
end
