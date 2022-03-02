# frozen_string_literal: true

def length_of_longest_substring(s)
  substring = ''
  longest = 0

  for index in 0...s.length
    char = s[index]

    char_index = substring.index(char)

    unless char_index.nil?
      longest = longest > substring.length ? longest : substring.length
      substring.slice!(0..char_index)
    end

    substring = substring + char
  end

  longest = longest > substring.length ? longest : substring.length
  longest
end


  # indexes = Array.new(255)
  #
  # longest = 0
  #
  # if s.length > 0
  #   longest += 1
  #
  #   indexes[s[0].ord] = 0
  # else
  #   return 0
  # end
  #
  # for index in 1...s.length
  #   this_char_code = s[index].ord
  #
  #   this_char_code_index = indexes[this_char_code]
  #   unless this_char_code_index.nil?
  #     longest = [longest, index - indexes.reject { |e| e.nil? }.min].max
  #     indexes.map! { |e| e.nil? || e < this_char_code_index ? nil : e }
  #   end
  #
  #   indexes[this_char_code] = index
  # end
  #
  # longest = [longest, s.length - indexes.reject { |e| e.nil? }.min].max
# end

p length_of_longest_substring("abcabcbb")
p length_of_longest_substring("bbbbb")
p length_of_longest_substring("pwwkew")
p length_of_longest_substring("pwwkepw")
p length_of_longest_substring("abcde")
p length_of_longest_substring("cdd")
p length_of_longest_substring("dvdf")
