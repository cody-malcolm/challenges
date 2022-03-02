# frozen_string_literal: true

def count_bits(n)
  arr = Array.new(n + 1)
  m = 0
  arr[0] = m
  (1..n).each do |i|
    if (i & 1 == 1)
      m += 1
    else
      t = i
      m -= 1 until (t = t >> 1) & 1 == 1
    end
    arr[i] = m
  end
  arr
end

p count_bits(10)
p count_bits(0)
p count_bits(32)