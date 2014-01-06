require "thor"
require "sass"

require "tinge/version"

module Tinge
  autoload :CLI,        "tinge/cli"
  autoload :Color,      "tinge/color"
  autoload :Formatters, "tinge/formatters"
  autoload :Parser,     "tinge/parser"
  autoload :Reporters,  "tinge/reporters"
  autoload :Sighting,   "tinge/sighting"
end

require "tinge/ext/sass"
