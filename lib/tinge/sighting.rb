module Tinge

  class Sighting

    attr_reader :color, :node, :parent
    def initialize(color, node, parent = nil)
      @color  = color
      @node   = node
      @parent = parent
    end

  end

end
