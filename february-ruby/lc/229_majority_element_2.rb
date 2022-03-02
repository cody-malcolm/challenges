# frozen_string_literal: true

def count(a, l, r, n)
  num = 0
  for i in (l..r)
    num += 1 if a[i] == n
  end
  num
end

def helper(a, l, r)
  return nil if l > r
  return [a[l]] if l == r
  return [a[l], a[r]].uniq if r - l == 1

  one_third = l + ((r - l) / 3)
  two_third = l + ((r - l) / 3) * 2 + 1

  one_majority = helper(a, l, one_third)
  two_majority = helper(a, one_third + 1, two_third)
  three_majority = helper(a, two_third + 1, r)

  candidates = []
  one_majority.each { |n| candidates.append(n) } unless one_majority.nil?
  two_majority.each { |n| candidates.append(n) } unless two_majority.nil?
  three_majority.each { |n| candidates.append(n) } unless three_majority.nil?
  
  threshold = (r - l + 1) / 3 + 1

  frequent = []
  for candidate in candidates
    frequent.append(candidate) if count(a, l, r, candidate) >= threshold
  end

  frequent.uniq
end

def majority_element(nums)
  helper(nums, 0, nums.size - 1)
end

p majority_element([3, 2, 3])
p majority_element([1])
p majority_element([1, 2])
p majority_element([2, 2, 1, 1, 1, 2, 2])
p majority_element([8,8,8,8,8,8,8,5,5,5,5,5,5,5,5])
p majority_element([4, 4, 4, 4])
p majority_element([4, 5, 4, 5, 5])
p majority_element([4, 4, 4, 3, 6, 7, 4])