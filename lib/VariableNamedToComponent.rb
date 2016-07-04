require 'pathname'

module SCSSLint
    class Linter::VariableNamedToComponent < Linter
        include LinterRegistry

        def visit_root(_node)
            @divider="-"
            @whitelistedPartials = []
            @componentName = File.basename(_node.filename, '.scss')

            if @componentName.start_with?"_"
                #remove filename leading "_"
                @componentName = @componentName[1..-1]
            end

            if (config['divider'] != nil)
                 @divider = config['divider']
            end

            if (config['whitelistedPartials'] != nil)
                 @whitelistedPartials = config['whitelistedPartials']
            end

            yield # Continue linting children
        end

        def visit_variable(node)
            if !node.name.start_with?@componentName + @divider and !@whitelistedPartials.include?@componentName
                add_lint(node, "\"$#{node.name}\" is not named after its container component - prefer \"$#{@componentName}#{@divider}#{node.name}\".")
            end

            yield # Continue
        end

    end
end