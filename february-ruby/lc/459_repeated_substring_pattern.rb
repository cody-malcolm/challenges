# frozen_string_literal: true

def get_factors(num)
  results = []
  i = 2
  while i <= num ** 0.5
    if (num % i).zero?
      results.append(i)
      results.append(num / i)
    end
    i += 1
  end
  results
end

# 869ms
# def repeated_substring_pattern(s)
#   size = s.size

#   len = 1

#   while (len <= size / 2)
#     i = 0
#     i += len while (s.slice(i, len) == s.slice(i + len, len) && i + len < size)
#     return true if i + len >= size
#     len += 1
#   end

#   return false
# end

# 133ms
def repeated_substring_pattern(s)  
  size = s.size
  return false if size == 1

  vals = get_factors(size)
  vals.append(1)

  vals.each do |factor|
    i = 0
    i += factor while (s.slice(i, factor) == s.slice(i + factor, factor) && i + factor < size)
    return true if i + factor >= size
  end

  return false
end

# 1417ms
# def repeated_substring_pattern(s)
#   size = s.size
#   return false if size == 1
#   haystack = s + s
#   haystackInit = haystack.slice(1, size)
#   return true if haystackInit == s

#   haystackSum = haystackInit.chars.map(&:ord).sum
#   sSum = s.chars.map(&:ord).sum
#   haystackSize = haystack.size
  
#   i = 1

#   while i + size < haystackSize - 1
#     haystackSum -= haystack[i].ord
#     haystackSum += haystack[i + size].ord
#     i += 1
#     if haystackSum == sSum
#       return true if haystack.slice(i, size) == s
#     end    
#   end
#   return false
# end

# 64ms
# def repeated_substring_pattern(s)
#   !(s.slice(1, s.size - 1) + s.slice(0, s.size - 1)).index(s).nil?
# end

p repeated_substring_pattern("abab")
p repeated_substring_pattern("abc")
p repeated_substring_pattern("abcabcabcabc")