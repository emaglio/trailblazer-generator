module Trailblazer
  module Generator
    module Commands
      module Generate
        class Operation < Hanami::CLI::Command
          desc "Generates operation file"
          # long_desc <<-OPERATION_LONG_DESC

          # `generate operation` generate operation file

          # Actions Available:
          #   * index
          #   * create (includes present for new action)
          #   * show
          #   * update (includes present for edit action)
          #   * delete
          #   * generic (if name doesn't match above, is generic)

          # Examples:
          #   `generate operation BlogPost --actions index,foo`

          #   Will generate an index operation for BlogPost and a foo operation (using generic template)

          # OPERATION_LONG_DESC
          # options actions: :required
          def call(*)
            # Trailblazer::Generator::Builder::Operation.(name: name, options: options)
          end
        end
      end
    end
  end
end
