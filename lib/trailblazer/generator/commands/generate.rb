require 'trailblazer/generator/commands/generate/cell'
require 'trailblazer/generator/commands/generate/contract'
require 'trailblazer/generator/commands/generate/operation'

module Trailblazer
  module Generator
    module Commands
      extend Hanami::CLI::Registry

      module Generate
      end

      register "generate", aliases: ["g"] do |prefix|
        prefix.register "cell", Generate::Cell
        prefix.register "contract", Generate::Contract
        prefix.register "operation", Generate::Operation
      end
    end
  end
end

