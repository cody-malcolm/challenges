# frozen_string_literal: true

def reverse_bits(n)
  output = 0
  32.times do 
    output <<= 1
    output |= (n & 1)
    n >>= 1
  end
  output
end

p reverse_bits(-3)