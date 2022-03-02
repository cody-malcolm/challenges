# frozen_string_literal: true

def build_array(nums)
  nums.map { |e| nums[e] }
end

p build_array([0,2,1,5,3,4])
p build_array([5,0,1,2,3,4])
