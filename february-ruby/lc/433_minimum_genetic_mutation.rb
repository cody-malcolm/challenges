# frozen_string_literal: true

def most?(s1, s2)
  flag = false

  s1.each_char.with_index do |c, i|
    next if s2[i] == c
    return false if flag
    flag = true
  end

  flag
end

def min_mutation(start, en, bank)
  flag = bank.delete(en)
  return -1 if flag.nil?
  bank.append(start)
  count = 0
  words_to_check = [en]
  count_increment = words_to_check.last
  temp = [[], bank]

  while words_to_check.size > 0
    curr = words_to_check.shift
    return count if curr == start
    temp = temp[1].partition { |w| most?(w, curr) }
    temp[0].each { |w| words_to_check.append(w) }
    if count_increment == curr
      count += 1
      count_increment = words_to_check.last
    end
  end
  -1
end

p min_mutation("AACCGGTT", "AACCGGTA", ["AACCGGTA"]) # 1
p min_mutation("AACCGGTA", "AACCGGTA", ["AACCGGTA"]) # 0
p min_mutation("AACCGGTT", "AAACGGTA", ["AACCGGTA", "AACCGCTA", "AAACGGTA"]) # 2
p min_mutation("AACCGGTT", "AAACGGTA", ["AACCGGTA", "AACCGCTA"]) # -1
p min_mutation("AAAAACCC", "AACCCCCC", ["AAAACCCC", "AAACCCCC", "AACCCCCC"]) # 3



