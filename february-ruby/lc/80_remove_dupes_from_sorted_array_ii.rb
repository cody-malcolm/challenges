# frozen_string_literal: true

def remove_duplicates(nums)
  i = 2
  while i < nums.size
    if nums[i - 2] == nums[i]
      nums.delete_at(i)
    else
      i += 1
    end
  end
  nums.size
end

p remove_duplicates([1,1,1,2,2,3])

p remove_duplicates([0,0,1,1,1,1,2,3,3])
