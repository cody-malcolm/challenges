# frozen_string_literal: true

def find_pairs(nums, k)
    if k == 0
        hash = Hash.new(0)
        nums.each { |n| hash[n] += 1 }
        return hash.values.select { |count| count > 1 }.size
    end
    hash = Hash.new(0)
    nums.uniq.each { |n| hash[n] += 1 }

    count = 0
    hash.keys.each do |key|
        count += hash[key] * (hash[key - k]) if hash.key?(key - k)
    end
    count
end

p find_pairs([3, 1, 4, 1, 5], 2)
p find_pairs([1, 2, 3, 4, 5], 1)
p find_pairs([1, 3, 1, 5, 4], 0)
