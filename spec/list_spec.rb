require_relative '../lib/list.rb'
include Listing

RSpec.describe Listing do
  describe '#remove_dup' do
    let(:repeat_string_one) { 'KenyaKenya' }
    it 'Should remove the repeated strings' do
      actual = repeat_string_one.remove_dup
      expect(actual).to eq('Kenya')
    end

    let(:repeat_string_two) { 'USAUSA' }
    it 'Should remove the repeated strings' do
      actual = repeat_string_two.remove_dup
      expect(actual).to eq('USA')
    end
  end
end
