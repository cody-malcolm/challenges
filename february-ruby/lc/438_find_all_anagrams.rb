# frozen_string_literal: true

s1 = 'cbaebabacd'
p1 = 'abc'

s2 = 'abab'
p2 = 'ab'

def find_anagrams(s, p)
  results = []
  key = Array.new(26) { 0 }
  current = Array.new(26) { 0 }

  p.chars.each do |letter|
    key[letter.ord - 97] += 1
  end

  sl = s.length
  pl = p.length

  s.slice(0, pl - 1).chars.each do |letter|
    current[letter.ord - 97] += 1
  end

  i = 0

  until i > sl - pl
    current[s[i + pl - 1].ord - 97] += 1
    results.append(i) if key == current
    current[s[i].ord - 97] -= 1
    i += 1
  end

  results
end

p find_anagrams(s1, p1)
p find_anagrams(s2, p2)
