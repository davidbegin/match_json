require 'json'
require 'colorize'
require 'match_json/title'
require "match_json/version"
require 'match_json/key_errors'
require 'match_json/parse_errors'
require 'match_json/value_errors'
require 'match_json/rspec_output'
require 'match_json/hash_comparison'
require 'match_json/string_comparison'

module MatchJSON
  class JSONMatcher
    include Title
    include KeyErrors
    include ParseErrors
    include ValueErrors
    include RspecOutput
    include HashComparison
    include StringComparison

    attr_reader :expected, :actual

    def initialize(expected)
      @expected = expected
    end

    def matches?(actual)
      @actual = actual
      string_comparison || hash_comparison
    end
  end

  def match_json(expected)
    JSONMatcher.new(expected)
  end
end
