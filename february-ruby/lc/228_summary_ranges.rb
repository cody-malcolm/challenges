# frozen_string_literal: true

def summary_ranges(nums)
  return [] if nums.empty?
  res = []
  last = nums[0]
  (1...nums.size).each do |i|
    unless (nums[i] == nums[i - 1] + 1)
      res.append(last == nums[i - 1] ? "#{last}" : "#{last}->#{nums[i - 1]}")
      last = nums[i]
    end
  end
  res.append(last == nums.last ? "#{last}" : "#{last}->#{nums.last}")
  res
end

p summary_ranges([])
p summary_ranges([0, 1, 2, 4, 5, 7])
p summary_ranges([0, 2, 3, 4, 6, 8, 9])