# frozen_string_literal: true

def title_to_number(column_title)
  sum = 0
  column_title.each_char do |c|
    sum *= 26
    sum += c.ord - 64
  end
  sum
end

p title_to_number("A")
p title_to_number("AB")
p title_to_number("ZY")
p title_to_number("ZZ")
p title_to_number("AAA")