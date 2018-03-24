module Trailblazer
  module Generator
    module Commands
      module Generate
        class Contract < Hanami::CLI::Command
          desc "Generates contract file"
          # long_desc <<-CONTRACT_LONG_DESC

          # `generate contract` generate contract file

          # CONTRACT_LONG_DESC
          # options actions: :required
          # options properties: :array
          def call(*)
            # Trailblazer::Generator::Builder::Contract.(name: name, options: options)
          end
        end
      end
    end
  end
end
