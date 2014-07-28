module MatchJSON
  module StringComparison
    def string_conversion(input)
      input.is_a?(String) ? input : input.to_json
    end

    def string_comparison
      @string_comparison ||= actual_as_string == expected_as_string
    end

    def actual_as_string
      @actual_as_string ||= string_conversion(actual)
    end

    def expected_as_string
      @expected_as_string ||= string_conversion(expected)
    end
  end
end
