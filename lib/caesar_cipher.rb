# frozen_string_literal: true

NUM_OF_LETTERS = ('A'..'Z').count

def caesar_cipher(string, shift_factor)
  arr = string.chars.map { |char| cipher_char(char, shift_factor) }
  arr.join
end

def cipher_char(char, shift_factor)
  return char unless ('A'..'Z').include? char.upcase

  starting_ord = char.upcase == char ? 'A'.ord : 'a'.ord
  letter_pos = (char.ord + shift_factor - starting_ord) % NUM_OF_LETTERS
  new_char_ord = letter_pos + starting_ord
  new_char_ord.chr
end
