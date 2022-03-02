class Solution:
  def isPowerOfTwo(self, n: int) -> bool:
    return n != 0 and (n & (n - 1)) == 0


print(Solution().isPowerOfTwo(3))
print(Solution().isPowerOfTwo(0))
print(Solution().isPowerOfTwo(16))
print(Solution().isPowerOfTwo(4))
print(Solution().isPowerOfTwo(-3))


# class Solution {
#     public boolean isPowerOfTwo(int n) {
#         return n != 0 && (n & (n - 1)) == 0;
#     }
# }