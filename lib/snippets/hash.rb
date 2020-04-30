class Hash
  def string_cancat_merge(hash_b, delimiter = ' ')
    (self.keys + hash_b.keys).uniq.map do |key|
      value_a = self[key]
      value_b = hash_b[key]

      if value_a.class != value_b.class
        if value_a.nil?
          [key, value_b]
        elsif value_b.nil?
          [key, value_a]
        else
          [key, value_b]
        end
      else
        case value_a
        when String
          [key, value_a + delimiter + value_b]
        when Hash
          [key, value_a.string_cancat_merge(value_b, delimiter)]
        else
          [key, value_b]
        end
      end
    end.to_h
  end
end
