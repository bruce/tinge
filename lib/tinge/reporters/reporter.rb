module Tinge
  module Reporters

    class Reporter

      def self.handles(format)
        Reporters.add(format, self)
      end

      def initialize(result, formatter)
        @result = result
        @formatter = formatter
      end

    end
  end
end
