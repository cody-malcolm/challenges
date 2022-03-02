# frozen_string_literal: true

def three_sum(nums)
  nums.sort!

  triples = []
  last_seen = nil
  for i in (2...nums.length)
    pairs = two_sum(nums.slice(0, i), 0 - nums[i])
    pairs.each { |p| triples.append(p.append(nums[i])) }
  end

  triples.uniq(&:sort)
  # hash = {}
  # triples = []
  # nums.each.with_index do |n, i|
  #   hash[-n].each { |a| triples.append([a[0], a[1], n]) } if hash.key?(-n)
  #   (0...i).each do |j|
  #     hash[n + nums[j]] = [] unless hash.key?(n + nums[j])
  #     hash[n + nums[j]].append([n, nums[j]])
  #   end
  # end
  # triples.uniq(&:sort)
end

def two_sum(nums, k)
  i = 0
  j = nums.size - 1
  pairs = []
  while i < j && nums[i] * 2 <= k
    key = k - nums[i] - nums[j]
    pairs.append([nums[i], nums[j]]) if key.zero?
    j -= 1 if key.negative?
    i += 1 unless key.negative?
  end
  pairs
end

# p two_sum([2,7,11,15], 9)
# p two_sum([2,3,4], 6)
# p two_sum([3,3], 6)
# p two_sum([0, 1,2,3,4,7,8,12,15,16,17], 16)


p three_sum([-1, 0, 1, 2, -1, 4])
p three_sum([-1, -1, -1, -1, 2, 2, 2, -1, -1])
p three_sum([0, 0, 0, 0, 0, 1, -1, 3])
p three_sum([])
p three_sum([0])
p three_sum([-1, 0, 1, 2, -1, -4, -2, -3, 3, 0, 4])
