module MatchJSON
  module KeyErrors
    def key_error_messages
      extra_keys_error_message + missing_keys_error_message
    end

    def extra_keys
      @extra_keys ||=
        parsed_actual.keys - parsed_expected.keys
    end

    def missing_keys
      @missing_keys ||=
        parsed_expected.keys - parsed_actual.keys
    end

    def extra_keys_error_message
      unless extra_keys.empty?
        "Extra Keys:\n".light_cyan +
        "\t#{extra_keys.join(', ')}".light_black +
        "\n\n"
      end
    end

    def missing_keys_error_message
      unless missing_keys.empty?
        "Missing Keys:\n".light_cyan +
        "\t#{missing_keys.join(', ')}".light_red +
        "\n\n"
      end
    end
  end
end
