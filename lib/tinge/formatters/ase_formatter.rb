module Tinge
  module Formatters

    class ASEFormatter < Formatter

      handles :ase

      dependency 'ase'

      def self.stringify_colors?
        false
      end

      def self.require_filename?
        true
      end

      def render
        doc = ASE.new

        palette = ASE::Palette.new("Colors")
        @reporter.data.each do |name, color|
          palette.add name, ase_color(color)
        end
        doc << palette
        doc.to_file(@filename)
      end

      private

      # Note: Alpha is not supported
      def ase_color(color)
        ASE::Color::RGB.new(color.red, color.green, color.blue)
      end

    end

  end
end
