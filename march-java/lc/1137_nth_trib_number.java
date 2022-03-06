// 0ms / 100% / 41.1MB / 19%

class Solution {
  public int tribonacci(int n) {
      if (n == 0) return 0;
      if (n == 1 || n == 2) return 1;
      int index = -1;
      int[] vals = new int[]{0, 1, 1};
      for (int i = 3; i <= n; i++) {
          index++;
          index %= 3;
          vals[index] = vals[0] + vals[1] + vals[2];
      }
      return vals[index];
  }
}