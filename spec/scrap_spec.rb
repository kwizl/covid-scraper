require 'httparty'

require_relative '../lib/scrap.rb'

RSpec.describe Scrap do
  describe '#get_validation' do
    let(:url) { 'https://www.worldometers.info/coronavirus/' }
    it 'Should return TRUE if the get request is successful' do
      response = HTTParty.get(url)
      actual = subject.get_validation(response)
      expect(actual).to be(true)
    end
  end
end
