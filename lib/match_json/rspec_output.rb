module MatchJSON
  module RspecOutput
    def failure_message_when_negated
      title + spec_input + "\n" +
      "You thought something would NOT happen and it did somehow" + "\n "
    end

    def spec_input
      "Expected:".light_cyan + "\n\n" + colorize_all(expected, :light_green) + "\n\n" +
      "Actual:".light_cyan + "\n\n" + colorize_all(actual, :light_yellow) + "\n\n"
    end

    def colorize_all(string, color, opts = {})
      formatted_string = if opts[:gsub].nil?
                           string
                         else
                           string.gsub(opts[:gsub][0], opts[:gsub][1])
                         end

      formatted_string.split("\n").map {|x| x.send(color)}.join("\n")
    end


    def divider
      "#{'-' * 40}".light_black + "\n\n"
    end
  end
end
