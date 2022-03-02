# frozen_string_literal: true

def minimum_deviation(nums)
  nums.map! { |n| n.odd? ? n * 2 : n }
  nums.sort!
  diff = nums[-1] - nums[0]

  while nums[-1].even?
    curr = nums.pop / 2
    insertion_index = nums.bsearch_index { |n| n > curr }
    insertion_index.nil? ? nums.append(curr) : nums.insert(insertion_index, curr)
    diff = [diff, nums[-1] - nums[0]].min
  end
  diff
end

p minimum_deviation([1,2,3,4])
p minimum_deviation([4, 1, 5, 20, 3])
p minimum_deviation([2, 10, 8])
p minimum_deviation([4,4,4,5,5,5,22])
p minimum_deviation([1,3,5])
p minimum_deviation([6,6,7,7,20])
p minimum_deviation([12,12,13,13,20,22])
p minimum_deviation([2,2])
p minimum_deviation([3, 5])
p minimum_deviation([10,5,10,1])
p minimum_deviation([399, 908, 648, 357, 693, 502, 331, 649, 596, 698])