# frozen_string_literal: true
MOD = 10 ** 9 + 7

# def check_record(n)
#   return 0 if n.zero?
#   prev = [1, 1, 1, 0, 0, 0]
#   nex = [nil, nil, nil, nil, nil, nil]

#   (n - 1).times do
#     nex = [prev[0] + prev[2] + prev[4], prev.sum, prev[0], prev[1], prev[2], prev[3]]

#     prev = nex.map { |n| n % MOD }
#   end

#   return prev.sum % MOD
# end
def check_record(n)
  return 0 if n.zero?
  arr = [1, 1, 1, 0, 0, 0]
  (n - 1).times { arr = [arr[0] + arr[2] + arr[4], arr.sum, arr[0], arr[1], arr[2], arr[3]].map { |n| n % MOD } }
  arr.sum % MOD
end

p check_record(2)
p check_record(1)
p check_record(0)
p check_record(3)
p check_record(10101)