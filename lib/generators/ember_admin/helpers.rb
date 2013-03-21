module EmberAdmin
  module Helpers
    def singular_name
      @singular_name ||= file_name.singularize
    end

    def namespaced_singular_class
      @namespaced_singular_class ||= "#{application_name.camelize}.#{singular_name.capitalize}"
    end

    def namespaced_plural_class
      @namespaced_plural_class ||= "#{application_name.camelize}.#{plural_name.capitalize}"
    end

    def columns
      singular_table_name.classify.constantize.columns
    end

    def to_ember_type active_record_type
      case active_record_type
      when :string, :boolean
        active_record_type.to_s
      when :date, :datetime
        'date'
      else # integer
        'number'
      end
    end
  end
end

