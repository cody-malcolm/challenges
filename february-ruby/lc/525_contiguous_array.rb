# frozen_string_literal: true

# hash solution: 325ms
# def find_max_length(nums)
#   hash = {}
#   count = 0
#   longest = 0
#
#   nums.each_with_index do |e, i|
#     if hash.key?(count)
#       longest = [longest, i - hash[count]].max
#     else
#       hash[count] = i
#     end
#     count += e == 0 ? 1 : -1
#   end
#
#   longest = [longest, nums.length - hash[count]].max if hash.key?(count)
#   longest
# end

# array solution: 370ms
def find_max_length(nums)
  n = nums.length
  arr = Array.new(n * 2 + 1)
  count = 0
  longest = 0

  nums.each_with_index do |e, i|
    if arr[n + 1 + count].nil?
      arr[n + 1 + count] = i
    else
      longest = [longest, i - arr[n + 1 + count]].max
    end
    count += e == 0 ? 1 : -1
  end

  longest = [longest, n - arr[n + 1 + count]].max unless arr[n + 1 + count].nil?
  longest
end

a1 = [0, 1]
a2 = [0, 1, 0]
a3 = [1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1]
a4 = [1, 1, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0]
a5 = [1, 1, 1, 1, 1, 0, 0, 0]
a6 = [1, 1, 1]
a7 = [0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0]
a8 = [0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1]

p find_max_length(a1)
p find_max_length(a2)
p find_max_length(a3)
p find_max_length(a4)
p find_max_length(a5)
p find_max_length(a6)
p find_max_length(a7)
p find_max_length(a8)
