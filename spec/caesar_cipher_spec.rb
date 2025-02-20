# frozen_string_literal: true

require_relative '../lib/caesar_cipher'

describe '#caesar_cipher' do # rubocop:disable Metrics/BlockLength
  context 'When string is empty' do
    it 'returns an empty string' do
      str = ''
      result = caesar_cipher(str, 23)
      expect(result).to eq('')
    end
  end

  context 'When string contains only letters' do
    it 'returns correct output for positive shift' do
      result = caesar_cipher('hello', 7)
      expect(result).to eq('olssv')
    end

    it 'returns correct output for negative shift' do
      result = caesar_cipher('hello', -4)
      expect(result).to eq('dahhk')
    end

    it 'returns correct output for very large shift' do
      result = caesar_cipher('Ohayou', 700)
      expect(result).to eq('Mfywms')
    end

    it 'maintains case' do
      result = caesar_cipher('WhAt A STRing', -5)
      expect(result).to eq('RcVo V NOMdib')
    end
  end

  context 'When string contains other characters' do
    it 'returns the string for special-characters-only string' do
      str = '@#$ &&>.'
      result = caesar_cipher(str, 7)
      expect(result).to eq(str)
    end

    it 'correctly converts letters' do
      result = caesar_cipher("H$llo, World!\#@", 16)
      expect(result).to eq("X$bbe, Mehbt!\#@")
    end
  end
end
