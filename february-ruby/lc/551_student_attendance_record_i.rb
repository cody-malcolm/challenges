# frozen_string_literal: true

def check_record(s)
  absents = 0
  lates = 0
  arr = s.chars
  until arr.empty?
    curr = arr.pop
    case curr
    when "A"
      absents += 1
      lates = 0
      return false if absents == 2
    when "L"
      lates += 1
      return false if lates == 3
    when "P"
      lates = 0
    end
  end
  true
end

p check_record("PPALLP")
p check_record("PPALLL")
p check_record("APPALLP")