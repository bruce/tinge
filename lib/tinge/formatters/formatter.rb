module Tinge
  module Formatters

    class Formatter

      def self.handles(*formats)
        formats.each do |format|
          Formatters.add(format, self)
        end
      end

      def self.dependency(name, filename = name)
        dependencies[name] = filename
      end

      def self.dependencies
        @dependencies ||= {}
      end

      def self.stringify_colors?
        true
      end

      def self.require_filename?
        false
      end

      def initialize(reporter, filename = nil)
        require_dependencies
        @reporter = reporter
        @filename = filename
      end

      private

      def output(text)
        if @filename
          File.open(@filename, 'w') { |f| f.write text }
        else
          puts text
        end
      end

      def require_dependencies
        self.class.dependencies.each do |name, filename|
          begin
            require filename
          rescue LoadError
            raise LoadError, "Please install '#{name}' for this format"
          end
        end
      end

    end
  end
end
