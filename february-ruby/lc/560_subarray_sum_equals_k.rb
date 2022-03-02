# frozen_string_literal: true

def subarray_sum(nums, k)
  hash = Hash.new(0)
  hash[0] += 1
  sum = 0
  count = 0

  nums.each do |num|
    sum += num
    key = sum - k
    count += hash[key]
    hash[sum] += 1
  end

  count
end

p subarray_sum([1, 1, 1], 2)
p subarray_sum([1, 2, 3], 3)
