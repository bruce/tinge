module Sass
  module Tree
    class VariableNode < Node
      def self.visit_method
        :visit_and_save_variable
      end
    end
    module Visitors
      class Perform < Base

        class << self
          attr_accessor :tinge_parser
        end

        def visit_and_save_variable(node)
          var = @environment.var(node.name)
          return [] if node.guarded && var && !var.null?
          val = node.expr.perform(@environment)
          @environment.set_var(node.name, val)
          if self.class.tinge_parser
            self.class.tinge_parser.set_var(node.name, val)
          end
          []
        end
      end
    end
  end

end
