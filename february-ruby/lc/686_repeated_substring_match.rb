# frozen_string_literal: true

def repeated_string_match(a, b)
  a_size = a.size
  b_size = b.size
  if (a_size > b_size)
    return a.index(b).nil? ? (a + a).index(b).nil? ? -1 : 2 : 1
  end

  mults = (b_size / a_size).ceil
  duped_a = a * mults
  
  duped_a.index(b).nil? ? (duped_a + a).index(b).nil? ? (duped_a + a + a).index(b).nil? ? -1 : mults + 2 : mults + 1 : mults
end

p repeated_string_match("abcd", "cdabcdab")
p repeated_string_match("a", "aa")
p repeated_string_match("abcd", "cdabcd")
p repeated_string_match("aa", "a")