# frozen_string_literal: true

def two_sum(nums, target)
  hash = {}
  nums.each.with_index do |n, i|
    return [hash[target - n], i] if hash.key?(target - n)

    hash[n] = i
  end
end

p two_sum([2,7,11,15], 9)
p two_sum([3,2,4], 6)
p two_sum([3,3], 6)