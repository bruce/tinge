module Tinge

  class Parser

    def self.parse(text)
      new(text).tap { |parser|
        parser.run
      }.result
    end

    def initialize(text)
      @text = text
    end

    def document
      @document ||= Sass::Engine.new(@text, syntax: :scss).to_tree
    end

    def run
      visit(document)
    end

    def result
      @result ||= {}
    end

    def visit(node, parent = nil)
      if node.is_a?(Sass::Tree::PropNode) || node.is_a?(Sass::Tree::VariableNode)
        extract(node, parent)
      end
      node.each do |child|
        visit(child, node) unless child == node
      end
    end

    def extract(node, parent = nil)
      colors(node).each do |color|
        result[color] ||= Color.new(color)
        result[color].add_sighting(node, parent)
      end
    end

    def colors(node)
      case node
      when Sass::Tree::PropNode
        node.value.inspect.scan(/(#[0-9a-f]+|(?:hsl|rgb)a?\([^\)]+\))/).flatten
      when Sass::Tree::VariableNode
        if node.expr.is_a?(Sass::Script::Color)
          [node.expr.to_s]
        else
          []
        end
      end
    end

  end

end
