module RSpec
  module Core
    class ExampleGroup
      include Tivo::Hooks

      def self.run_after_all_hooks(example_group_instance)
        return if descendant_filtered_examples.empty?
        assign_before_all_ivars(before_all_ivars, example_group_instance)

        begin
          run_hook(:after, :all, example_group_instance)
        rescue Tivo::PendingRequestError => e
          RSpec.configuration.reporter.message <<-EOS

A Tivo error occurred in an after(:all) hook.
  #{e.class}: #{e.message}
  occurred at #{e.backtrace.first}

        EOS
        rescue => e
          # TODO: come up with a better solution for this.
          RSpec.configuration.reporter.message <<-EOS

An error occurred in an after(:all) hook.
  #{e.class}: #{e.message}
  occurred at #{e.backtrace.first}

        EOS
        end
      end

    end
  end
end
