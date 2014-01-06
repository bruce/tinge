module Tinge
  module Formatters

    class RubyFormatter < Formatter

      handles :ruby

      def render
        output @reporter.data.inspect
      end

    end

  end
end
