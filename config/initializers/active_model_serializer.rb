module ActiveModel
  class Serializer
    def self.attributes_for_serialization
      self._attributes.values
    end
  end
end

