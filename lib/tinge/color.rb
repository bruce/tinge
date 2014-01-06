module Tinge

  class Color

    def initialize(text)
      @text = text
    end

    def add_sighting(node, parent = nil)
      sightings << Sighting.new(self, node, parent)
    end

    def sightings
      @sightings ||= []
    end

  end

end
