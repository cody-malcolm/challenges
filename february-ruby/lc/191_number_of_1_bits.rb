# frozen_string_literal: true

def hamming_weight(n)
  count = n & 1
  count += 1 if (n = n >> 1) & 1 == 1 while n > 0
  count
end

p hamming_weight(11)
p hamming_weight(128)
p hamming_weight(131)