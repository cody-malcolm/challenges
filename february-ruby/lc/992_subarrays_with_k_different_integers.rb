# frozen_string_literal: true

require 'set'

# def naive_solve_queue(queue, k)
#   counted = 0
#   for i in 0..(queue.size - k) do
#     for j in k..(queue.size - i) do
#       counted += 1 if queue.slice(i, j).uniq.size == k
#     end
#   end
#   counted
# end

def subarrays_with_k_distinct(nums, k)
  return 0 if nums.uniq.size < k

  queue = []
  my_set = Set[]
  flag = false
  nums.reduce(0) do |count, num|
    if flag
      unless my_set.include?(num)
        queue.shift until queue.uniq.size == k - 1
        my_set = Set.new(queue.uniq)
      end
    else
      flag = my_set.size == k
    end
    my_set.add(num)
    queue << num
    count += queue.size - k + 1 if flag
    p count, queue
    count
  end
end

nums1 = [1,2,1,2,3]
k1 = 2
nums2 = [1,2,1,3,4]
k2 = 3
nums3 = [27,27,43,28,11,20,1,4,49,18,37,31,31,7,3,31,50,6,50,46,4,13,31,49,15,52,25,31,35,4,11,50,40,1,49,14,46,16,11,16,39,26,13,4,37,39,46,27,49,39,49,50,37,9,30,45,51,47,18,49,24,24,46,47,18,46,52,47,50,4,39,22,50,40,3,52,24,50,38,30,14,12,1,5,52,44,3,49,45,37,40,35,50,50,23,32,1,2]
k3 = 20

p subarrays_with_k_distinct(nums1, k1)
p subarrays_with_k_distinct(nums2, k2)
p subarrays_with_k_distinct(nums3, k3)
