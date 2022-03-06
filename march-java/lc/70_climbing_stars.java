// 0ms / 100% / 40.9MB / 29.6%

class Solution {
  public int climbStairs(int n) {
      if (n < 4) return n;
      int index = 1;
      int[] vals = new int[]{2, 3};
      for (int i = 4; i <= n; i++) {
          index ^= 1;
          vals[index] = vals[0] + vals[1];
      }
      return vals[index];
  }
}