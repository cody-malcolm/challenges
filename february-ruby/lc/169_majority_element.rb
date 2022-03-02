# frozen_string_literal: true

def helper(a, l, r)
  return nil if l > r
  return a[l] if l == r

  mid = l + ((r - l) / 2)

  left_majority = helper(a, l, mid)
  right_majority = helper(a, mid + 1, r)

  return right_majority if left_majority.nil?
  return left_majority if right_majority.nil?
  return left_majority if left_majority == right_majority

  left_count = 0
  right_count = 0

  for i in (l..r)
    curr = a[i]
    left_count += 1 if curr == left_majority
    right_count += 1 if curr == right_majority
  end
  return nil if right_count == left_count
  left_count > right_count ? left_majority : right_majority
end

def majority_element(nums)
  helper(nums, 0, nums.size - 1)
end

p majority_element([3, 2, 3])
p majority_element([2, 2, 1, 1, 1, 2, 2])
p majority_element([8,8,8,8,8,8,8,5,5,5,5,5,5,5,5])
p majority_element([4, 4, 4, 4])
p majority_element([4, 5, 4, 5, 5])
p majority_element([4, 4, 4, 3, 6, 7, 4])