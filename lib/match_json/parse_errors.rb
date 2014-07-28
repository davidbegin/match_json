module MatchJSON
  module ParseErrors
    def json_parse_errors
      return "\n" unless @expected_json_parse_error || @actual_json_parse_error

      message = 'JSON Parsing Error:'.light_blue + "\n\n"
      if @expected_json_parse_error
        message << "There was an error parsing your".light_red + "\n\n" +
        "Expected JSON".blue + "\n" + expected.blue
      end
      if @actual_json_parse_error
        message << "There was an error parsing your".light_red + "\n\n" +
        "Actual JSON".yellow + "\n" + actual.yellow
      end
      message + "\n "
    end

  end
end
