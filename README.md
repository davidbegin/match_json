
#RSpec JSON Matcher
---


```ruby
# Gemfile
gem 'match_json', :git => 'git@github.com:presidentJFK/match_json.git'
```

```ruby
require 'match_json'

RSpec.configure do |config|
  config.include MatchJSON
end
```

```ruby
describe('JSON') do
  it('matches json that it is the same as') do
    expected_json = File.read('path/to/expected.json')
    actual_json = {"a" => 1, "b" => 2}.to_json
    expect(expected_json).to match_json(actual_json)
  end
end
```

![screenshot](/images/json_matcher_screenshot.png)
