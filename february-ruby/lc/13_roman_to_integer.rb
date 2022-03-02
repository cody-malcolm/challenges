# frozen_string_literal: true

def roman_to_int(s)
  key = { 'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000, 'A' => 4,
          'B' => 9, 'E' => 40, 'F' => 90, 'G' => 400, 'H' => 900 }
  s.gsub('IV', 'A').gsub('IX', 'B').gsub('XL', 'E').gsub('XC', 'F')
    .gsub('CD', 'G').gsub('CM', 'H').chars.map { |c| key[c] }.sum
end

p roman_to_int('III')
p roman_to_int('LVIII')
p roman_to_int('MCMXCIV')
