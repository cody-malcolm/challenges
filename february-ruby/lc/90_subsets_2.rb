require 'set'

def subsets_with_dup(nums)
  res = Set.new  
  (0..nums.size).each { |i| nums.combination(i) { |perm| res << perm.sort } }
  res
end

p subsets_with_dup([1,2,2])
p subsets_with_dup([4,4,4,1,4])