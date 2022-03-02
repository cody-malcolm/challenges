# frozen_string_literal: true

def remove_digit(num)
  return '0' if (s = num.size) < 2
  res = num
  for i in (0...(s - 1)) do
    if res[i] > res[i + 1]
      res = res[0, i] + res[i + 1, s]
      break
    end
  end
  return res[0, s - 1] if res == num

  res = res[1, res.length] while res[0] == '0'
  res == '' ? '0' : res
end

def remove_kdigits(num, k)
  res = num
  k.times { res = remove_digit(res) }
  res
end

p remove_kdigits('123', 1)
p remove_kdigits('10200', 1)
p remove_kdigits('10000000', 1)
p remove_kdigits('1432219', 3)
p remove_kdigits('10', 1)
p remove_kdigits('10', 2)
p remove_kdigits('10', 3)
p remove_kdigits('112', 1)