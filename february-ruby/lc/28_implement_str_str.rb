# frozen_string_literal: true

def str_str(haystack, needle)
  return 0 if needle == ""
  size = needle.size
  haystackInit = haystack.slice(0, size)
  return 0 if haystackInit == needle

  haystackSum = haystackInit.chars.map(&:ord).sum
  needleSum = needle.chars.map(&:ord).sum
  haystackSize = haystack.size
  
  i = 0

  while i + size < haystackSize
    haystackSum -= haystack[i].ord
    haystackSum += haystack[i + size].ord
    i += 1
    if haystackSum == needleSum
      return i if haystack.slice(i, size) == needle
    end    
  end
  return -1
end

p str_str("hello", "ll")
p str_str("aaaaa", "bba")
p str_str("testing", "")
p str_str("", "hola")
p str_str("", "")
p str_str("hell", "ll")