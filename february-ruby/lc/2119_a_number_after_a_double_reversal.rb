# frozen_string_literal: true

def is_same_after_reversals(num)
  num == 0 || !(num % 10).zero?
end

p is_same_after_reversals(526)
p is_same_after_reversals(1800)
p is_same_after_reversals(0)