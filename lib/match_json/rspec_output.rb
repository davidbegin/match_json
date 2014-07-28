module MatchJSON
  module RspecOutput
    def failure_message
      title + spec_input + divider + key_errors + value_errors + json_parse_errors
    end

    def failure_message_when_negated
      title + spec_input + "\n" +
      "You thought something would NOT happen and it did somehow" + "\n "
    end

    def spec_input
      "Expected:".light_cyan + "\n\n" + "#{expected_as_hash}".light_green + "\n\n" +
      "Actual:".light_cyan + "\n\n" + "#{actual_as_hash}".light_yellow + "\n\n"
    end

    def divider
      "#{'-' * 40}".light_black + "\n\n"
    end
  end
end
