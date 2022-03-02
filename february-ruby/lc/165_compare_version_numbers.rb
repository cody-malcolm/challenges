# frozen_string_literal: true

def compare_version(version1, version2)
  v1 = version1.split(".").map(&:to_i)
  v2 = version2.split(".").map(&:to_i)
  i = 0

  while i < v1.size || i < v2.size do
    cur1 = i < v1.size ? v1[i] : 0
    cur2 = i < v2.size ? v2[i] : 0
    
    return -1 if cur1 < cur2
    return 1 if cur2 < cur1
    i += 1
  end
  0
end

p compare_version("1.01", "1.001")
p compare_version("1.0", "1.0.0")
p compare_version("0.1", "1.1")