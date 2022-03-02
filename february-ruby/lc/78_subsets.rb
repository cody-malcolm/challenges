# frozen_string_literal: true

def subsets(nums)
  res = []  
  (0..nums.size).each { |i| nums.combination(i) { |perm| res << perm } }
  res
end

p subsets([1,2,3])