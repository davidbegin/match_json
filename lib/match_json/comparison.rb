module MatchJSON
  module Comparison
    def both_strings?
      actual.is_a?(String) && expected.is_a?(String)
    end

    def both_arrays?
      parsed_actual.is_a?(Array) && parsed_expected.is_a?(Array)
    end

    def both_hashes?
      parsed_actual.is_a?(Hash) && parsed_expected.is_a?(Hash)
    end

    def both_parseable?
      @parsed_actual = parse_and_catch_errors(actual)
      @parsed_expected = parse_and_catch_errors(expected)
      !!(@parsed_actual) && !!(@parsed_expected)
    end
  end
end
