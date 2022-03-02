# frozen_string_literal: true

def is_palindrome(x)
  return false if x < 0
  return true if x < 10
  arr = x.digits
  n = arr.size
  for i in 0...(n / 2) do
    return false unless arr[i] == arr[n - i - 1]
  end
  true
end

p is_palindrome(121)
p is_palindrome(-121)
p is_palindrome(10)
