# frozen_string_literal: true

# def add_digits(num)
#   num = num.divmod(10).sum while num > 9
#   num
# end

def add_digits(num)
  num.zero? ? 0 : 1 + (num - 1) % 9
end
