# frozen_string_literal: true

def maximum_unique_subarray(nums)
  return nums.sum if nums.size < 2

  queue = []
  hash = {}

  nums.each.reduce(-1) do |max, num|
    hash.delete(n = queue.shift) until (queue.empty? || n == num) if hash.key?(num)

    queue << hash[num] = num
    [max, queue.sum].max
  end
end

nums1 = [4,2,4,5,6]
nums2 = [5,2,1,2,5,2,1,2,5]

p maximum_unique_subarray(nums1)
p maximum_unique_subarray(nums2)
