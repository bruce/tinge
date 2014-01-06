require "thor"
require "sass"

require "tinge/version"

module Tinge
  autoload :CLI,      "tinge/cli"
  autoload :Color,    "tinge/color"
  autoload :Parser,   "tinge/parser"
  autoload :Sighting, "tinge/sighting"
end
