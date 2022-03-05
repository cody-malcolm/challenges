// 5ms / 58.38% / 44.5MB / 35.51%

class Solution {
  public int deleteAndEarn(int[] nums) {
      int[] freqs = new int[10001];
      for (int num : nums) freqs[num]++;
      int twoAgo = 0;
      int last = freqs[1];
      int curr = 0;
      for (int i = 2; i < 10001; i++) {
          curr = freqs[i] * i + twoAgo;
          curr = curr > last ? curr : last;
          twoAgo = last;
          last = curr;
      }

      return curr;
  }
}