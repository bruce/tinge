module Tinge
  module Formatters

    class JSONFormatter < Formatter

      handles :json

      dependency 'multi_json'

      def render
        output MultiJson.dump(@reporter.data)
      end

    end

  end
end
