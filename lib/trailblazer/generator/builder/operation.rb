REGEXP = /^[A-Z][A-Za-z]{1,}(::[A-Z][A-Za-z]{1,})?/
# Plase, keep error codes sorted alphabetically
ERROR_INVALID_CLASS_NAME = 1

class Trailblazer::Generator::Builder::Operation < Trailblazer::Operation

  class Cell < Trailblazer::Generator::Cell
  end

  step :validate_class!
  step :generate_actions!
  failure :error!

  def validate_class!(options, params:, **)
    return true if params[:name].match REGEXP

    options['failure_message'] = 'You provided an invalid class name'
    options['error_code'] = ERROR_INVALID_CLASS_NAME
    false
  end

  def generate_actions!(options, params:, **)
    actions = params[:options]['actions'].split(',')
    actions.each do |action|
      generate_file(options, name: params[:name], action: action)
    end
  end

  def error!(options, *)
    puts "Error: " + options['failure_message']
    options['error_code'] ? exit(options['error_code']) : exit(1)
  end

  private
    def generate_file(options, name:, action:)
      model = Trailblazer::Generator::Cell.build_model(
        name: name, action: action
      )
      params = options['params'][:options]
      content = Cell.(model, params)

      name = Trailblazer::Generator::Inflector.underscore(name)
      path = File.join('app', 'concepts', name, 'operation', "#{action}.rb")

      Trailblazer::Generator::Output.new(path: path, content: content).save
    end
end
