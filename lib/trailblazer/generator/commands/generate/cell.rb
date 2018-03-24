module Trailblazer
  module Generator
    module Commands
      module Generate
        class Cell < Hanami::CLI::Command
          desc "Generates cell file"
          # long_desc <<-CELL_LONG_DESC

          # `generate cell` generate cell and view file

          # Actions Available:
          #   * new
          #   * show
          #   * index (will generate item as well)
          #   * edit
          #   * generic (if name doesn't match above, is generic)

          # Template Engine for view:
          #   * default => erb

          # Examples:
          #   `generate cell BlogPost --actions index,foo --template-engine slim`

          #   Will generate an index, item and foo cell files and the corrisponding template using slim

          # CELL_LONG_DESC
          argument :name, required: true, desc: "Concept name"
          options :actions, required: true, desc: "Cell class name"
          option :template_engine, default: "erb"
          def call(name:)
            # raise options.inspect
            Trailblazer::Generator::Builder::Cell.(name: name, options: options)
          end
        end
      end
    end
  end
end
