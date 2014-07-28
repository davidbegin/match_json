module MatchJSON
  module HashComparison
    def hash_comparison
      @hash_comparision ||= actual_as_hash == expected_as_hash
    end

    def actual_as_hash
      @actual_as_hash ||= hash_conversion(actual)
    end

    def expected_as_hash
      @expected_hash_converson ||= hash_conversion(expected)
    end

    def hash_conversion(input)
      case input
      when String
        parsed_input = JSON.parse(input)
        if parsed_input.is_a?(Array)
          parsed_input[0]
        else
          parsed_input
        end
      when Array
        input[0]
      when Hash
        input
      end
    rescue JSON::ParserError
      input == expected ? @expected_json_parse_error = true : @actual_json_parse_error = true
      {}
    end
  end
end
