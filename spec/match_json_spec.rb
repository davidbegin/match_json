require 'spec_helper'

describe 'match_json matcher' do
  context 'matching json' do
    it 'matches raw json and raw json' do
      json_string1 = '{"a":"1","b","2"}'
      json_string2 = '{"a":"1","b","2"}'
      expect(json_string1).to match_json(json_string2)
    end

    it 'matches reading from a json file' do
      json_file1 = File.read('spec/fixtures/sample1.json')
      json_file2 = File.read('spec/fixtures/sample1.json')
      expect(json_file1).to match_json(json_file2)
    end

    it 'matches hashes' do
      json_file1 = File.read('spec/fixtures/sample1.json')
      # FAILING TEST TO SEE OUTPUT
      hash = {"a" => 1, "b" => 2, "d"=> 10, "e" => 1997}
      # PASSING TEST
      # hash = {"a" => 4, "b" => 2, "d"=> 10, "e" => 1997}
      expect(json_file1).not_to match_json(hash)
    end
  end

  context 'non matching json' do
    it 'handles too bad jsons', focus: true do
      json_string1 = '{"a":"1","b","2"}'
      json_file1 = File.read('spec/fixtures/sample1.json')
      json_file2 = File.read('spec/fixtures/sample2.json')
      # FAILING TEST TO SEE OUTPUT
      expect(json_file1).to match_json(json_file2)
      # PASSING TEST
      # expect(json_file1).not_to match_json(json_file2)
    end

    it 'handles json parse errors' do
      # json_string1 = '{"a":"1","b","2"}'
      json_file1 = File.read('spec/fixtures/sample1.json')
      json_file2 = File.read('spec/fixtures/sample2.json')
      # FAILING TEST TO SEE OUTPUT
      # expect(json_string1).to match_json(json_file1)
      expect(json_file1).to match_json(json_file2)
      # PASSING TEST
      # expect(json_file1).to match_json(json_file1)
    end
  end

  context 'it handles arrays of json' do
    it 'handles that shit' do
      json_array1 = File.read('spec/fixtures/json_array.json')
      json_array2 = File.read('spec/fixtures/json_array2.json')
      expect(json_array1).to match_json(json_array2)
    end
  end
end
