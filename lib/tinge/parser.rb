module Tinge

  class Parser

    class Result < Hash

      def vars
        @vars ||= {}
      end

    end

    def self.parse(text)
      new(text).tap { |parser|
        parser.run
      }.result
    end

    def initialize(text)
      @text = text
    end

    def set_var(name, value)
      result.vars[name] = value
    end

    def document
      parse_document unless @document
      @document
    end

    def parse_document
      Sass::Tree::Visitors::Perform.tinge_parser = self
      @engine = Sass::Engine.new(@text, syntax: :scss)
      @document = @engine.to_tree
      @engine.render
    end

    def run
      visit(document)
    end

    def result
      @result ||= Result.new
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
