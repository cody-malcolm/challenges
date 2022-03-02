# frozen_string_literal: true

def is_prefix_of_word(sentence, search_word)
  len = search_word.size
  sentence.split.each.with_index { |w, i| return i + 1 if w.slice(0, len) == search_word }
  return -1
end

p is_prefix_of_word("i love eating burger", "burg")
p is_prefix_of_word("this problem is an easy problem", "pro")
p is_prefix_of_word("i am tired", "you")
p is_prefix_of_word("hellohello hellohellohello", "ell")