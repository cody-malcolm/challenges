# frozen_string_literal: true

# def find_the_difference(s, t)
#     key = Array.new(26) { 0 }
#     s.chars.each { |c| key[c.ord - 97] += 1 }
#     t.chars.each { |c| key[c.ord - 97] -= 1 }
#     (key.index(-1) + 97).chr
# end

# def find_the_difference(s, t)
#   (t.chars.map(&:ord).sum - s.chars.map(&:ord).sum).chr
# end

s1 = "abcd"
t1 = "abcde"

s2 = ""
t2 = "y"

# p find_the_difference(s1, t1)
# p find_the_difference(s2, t2)

p s1.sum
p t1.sum
