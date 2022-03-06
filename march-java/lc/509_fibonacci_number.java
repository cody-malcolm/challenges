// 0ms / 100% / 41.6MB / 5.36%

class Solution {
  public int fib(int n) {
      if (n < 2) return n;
      int index = 1;
      int[] vals = new int[]{0, 1};
      for (int i = 2; i <= n; i++) {
          index ^= 1;
          vals[index] = vals[0] + vals[1];
      }
      return vals[index];
  }
}