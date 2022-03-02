# frozen_string_literal: true

def is_power_of_two(n)
  !n.zero? && (n & (n - 1)).zero?
end

p is_power_of_two(1)
p is_power_of_two(0)
p is_power_of_two(16)
p is_power_of_two(3)
p is_power_of_two(-2)