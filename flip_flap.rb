require_relative 'tsv_buddy'
require_relative 'yaml_buddy'
require 'yaml'
# class FlipFlap
class FlipFlap
  # Do NOT create an initialize method
  include TsvBuddy
  include YamlBuddy  
end
