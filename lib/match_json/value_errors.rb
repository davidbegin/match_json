module MatchJSON
  module ValueErrors
    def value_errors
      unless mismatch_hash.empty?
        "Mismatched Values:\n\n".light_cyan + mismatch_output.join("\n")
      end.to_s
    end

    def mismatch_hash
      mismatch_hash = {}

      expected_as_hash.keys.each do |key|
        mismatch_hash.merge!(key => value_diff(key)) unless no_mismatch_error?(key)
      end
      mismatch_hash
    end

    def no_mismatch_error?(key)
      key_mismatch?(key) || values_match?(key)
    end

    def key_mismatch?(key)
      actual_as_hash[key].nil?
    end

    def values_match?(key)
      expected_as_hash[key] == actual_as_hash[key]
    end

    def value_diff(key)
      {
        :expected => expected_as_hash[key],
        :actual => actual_as_hash[key]
      }
    end

    def mismatch_output
      mismatch_hash.map do |key, values|
        "Key: #{key}".white.colorize(:background => :blue) + "\n\t" +
        "Expected: #{values[:expected]}".light_green + "\n\t" +
        "Actual: #{values[:actual]}".light_yellow + "\n "
      end
    end
  end
end
