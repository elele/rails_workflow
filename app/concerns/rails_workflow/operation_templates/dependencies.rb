require 'active_support/concern'

module RailsWorkflow
  module OperationTemplates
    # = Workflow::ProcessTemplate::Dependenceis
    #
    # Operation dependencies is a set of conditions. Operation can be build if all that
    # dependenceis / conditions are satisfied. This is default implementation of dependenceis
    # which used to build operation dependency on other operations. You can customize dependency
    # for example you can add some additional logic depending on existiong processes / operations
    # or other conditions in your system.
    #

    module Dependencies

      extend ActiveSupport::Concern

      included do
        scope :independent_only, -> { where(dependencies: nil) }

        serialize :dependencies, JSON

        def resolve_dependency operation
          true
        end

        # def dependencies=(dependencies)
        #   write_attribute(:dependencies, dependencies.to_json.to_s)
        # end
        #
        def dependencies
          read_attribute(:dependencies) || []
        end

      end
    end
  end
end