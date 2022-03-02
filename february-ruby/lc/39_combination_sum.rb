# frozen_string_literal: true

def helper(sum, candidates, target, combo, combos)
    combos.append(combo) if sum == target && !combos.include?(combo)
    candidates.each do |c|
      if sum + c <= target
        new_arr = Array.new(combo)
        insertion_index = new_arr.bsearch_index { |e| e >= c }
        if insertion_index.nil?
          new_arr.push(c)
        else 
          new_arr.insert(insertion_index, c)
        end
        helper(sum + c, candidates, target, new_arr, combos)
      end
    end
end

def combination_sum(candidates, target)
  combos = []
  helper(0, candidates, target, [], combos)
  combos
end

p combination_sum([2, 3, 6, 7], 7)
p combination_sum([2, 3, 5], 8)
p combination_sum([2], 1)
p combination_sum([5, 10, 8, 4, 3, 12, 9], 27)