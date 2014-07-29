module MatchJSON
  module ArrayKeyErrors
    def missing_actual_hash_keys
      @missing_actual_hash_keys ||= parsed_actual - parsed_expected
    end

    def extra_actual_hash_keys
      @extra_actual_hash_keys ||= parsed_expected - parsed_actual
    end

    def remainder_message
      "Extra Hashes:\n".white +
      colorize_all(@extra.to_s, :light_black) + "\n\n" +
      "Missing Hashes:".magenta + "\n" +
      colorize_all(@missing.to_s, :blue, {:gsub => [",", ",\n"]})
    end

    def remainders?
      return false unless both_arrays?

      (extra_actual_hash_keys.is_a?(Array) && extra_actual_hash_keys.empty?)  &&
        (missing_actual_hash_keys.is_a?(Array) && missing_actual_hash_keys.empty?)
    end

  end
end
