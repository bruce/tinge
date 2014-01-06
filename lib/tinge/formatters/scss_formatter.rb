module Tinge
  module Formatters

    class ScssFormatter < Formatter

      handles :scss

      def render
        lines = []
        @reporter.data.sort.each do |name, value|
          lines << "$#{name}: #{value};"
        end
        output lines.join("\n")
      end

    end

  end
end
