module Tinge
  module Reporters

    class VariablesReporter < Reporter

      handles :variables

      def data
        @data ||= generate_data
      end

      private

      def generate_data
        if @formatter.stringify_colors?
          @result.vars.each_with_object({}) { |(k, v), obj|
            obj[k] = v.inspect # Sass::Script::Color#inspect
          }
        else
          @result.vars
        end
      end

    end

  end
end
