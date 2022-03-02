# frozen_string_literal: true

def check_inclusion(s1, s2)
  return false if s2.size < s1.size
  
  arr = Array.new(26) { 0 }

  s1.chars.each { |c| arr[c.ord - 97] += 1 }

  (0...s1.size).each do |i|
    arr[s2[i].ord - 97] -= 1
  end

  return true if arr.all?(&:zero?)

  i = 0

  while i + s1.size < s2.size
    arr[s2[i].ord - 97] += 1
    arr[s2[i + s1.size].ord - 97] -= 1
    return true if arr.all?(&:zero?)
    i += 1
  end
  false
end

p check_inclusion("ab", "eidbaooo")
p check_inclusion("ab", "eidboaoo")