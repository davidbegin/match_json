require 'pry'

module MatchJSON
  module KeyErrors
    def key_errors
      return if missing_keys.empty? && extra_keys.empty?

      missing_keys_error_message.to_s + extra_keys_error_message.to_s + divider
    end

    def extra_keys
      puts "actual_as_hash: #{actual_as_hash}"
      @extra_keys ||= actual_as_hash.keys - expected_as_hash.keys
    end

    def missing_keys
      puts "expected_as_hash: #{expected_as_hash}"
      @missing_keys ||= expected_as_hash.keys - actual_as_hash.keys
    end

    def extra_keys_error_message
      unless extra_keys.empty?
        "Extra Keys:\n".light_cyan + "#{extra_keys.join(', ')}".light_black + "\n\n"
      end
    end

    def missing_keys_error_message
      unless missing_keys.empty?
        "Missing Keys:\n".light_cyan + "#{missing_keys.join(', ')}".light_red + "\n\n"
      end
    end
  end
end
