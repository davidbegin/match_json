require 'json'
require 'pry'
require 'colorize'
require 'match_json/title'
require "match_json/version"
require 'match_json/key_errors'
require 'match_json/parse_errors'
require 'match_json/value_errors'
require 'match_json/rspec_output'
require 'match_json/comparison'
require 'match_json/array_key_errors'

# The real question is how do I make an elegant way of recursive building up the most
# focused error messages, and retaining a clean inerface for dispplying errors
#
# I think there needs to simply be a simple Class that takes a key and hash to compare against
#
# I have to make sure that a single example takes the same as many

module MatchJSON
  class JSONMatcher
    include Title
    include KeyErrors
    include ParseErrors
    include ValueErrors
    include RspecOutput
    include Comparison
    include ArrayKeyErrors

    attr_reader :expected,
                :actual,
                :error_types,
                :success_messages,
                :parsed_actual,
                :parsed_expected


    def initialize(expected)
      @expected = expected
      @error_types = []
      @success_messages = []
    end

    def matches?(actual)
      @actual = actual

      if both_strings?
        return true if actual == expected
        unless both_parseable?
          error_types << "Json wasn't parseable"
          return false
        end
        return parsed_actual == parsed_expected
      end

      if both_arrays?
        success_messages << "Both are Arrays"
        return remainders?
      end

      if both_hashes?
        extra_keys.empty? && missing_keys.empty?
      end
    end

    def failure_message
      failure_message_array = [title, spec_input]
      failure_message_array << divider << remainder_message if remainders?
      failure_message_array << key_error_messages << divider if both_hashes?
      failure_message_array << mismatch_output << divider if both_hashes?
      failure_message_array.join(" ")
    end
  end

  def match_json(expected)
    JSONMatcher.new(expected)
  end
end
