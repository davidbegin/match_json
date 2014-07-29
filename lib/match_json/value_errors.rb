module MatchJSON
  module ValueErrors
    # ErrorDetails
    def mismatch_hash
      hash = {}
      parsed_expected.keys.each do |key|
        hash.merge!(key => value_diff(key)) unless no_mismatch_error?(key)
      end
      hash
    end

    def no_mismatch_error?(key)
      key_mismatch?(key) || values_match?(key)
    end

    def key_mismatch?(key)
      parsed_actual[key].nil?
    end

    def values_match?(key)
      parsed_expected[key] == parsed_actual[key]
    end

    def value_diff(key)
      {
        :expected => parsed_expected[key],
        :actual => parsed_actual[key]
      }
    end

    def mismatch_output
      output = "Mismatched Values:\n\n".bold.red

      mismatch_hash.each_pair do |key, values|
        output <<
        "Key: #{key}".white.colorize(:background => :blue) << "\n\t " <<
        "Expected: #{values[:expected]}".light_green << "\n\t " <<
        "Actual: #{values[:actual]}".light_yellow << "\n\n "
      end

      output
    end

  end
end
