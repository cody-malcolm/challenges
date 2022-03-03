// 0ms / 100% / 42.7MB / 6.96%

class Solution {
  public int numberOfArithmeticSlices(int[] nums) {
      if (nums.length < 3) return 0;
      int count = 0;
      int startIndex = 0;
      int step = nums[1] - nums[0];
      int thisStep;
      int n;
      for (int i = 1; i < nums.length; i++) {
          thisStep = nums[i] - nums[i - 1];
          if (thisStep == step) continue;
          step = thisStep;
          n = i - startIndex - 2;
          if (n > 0) count += (n * (n + 1) / 2);
          startIndex = i - 1;
      }
      n = nums.length - startIndex - 2;
      if (n > 0) count += (n * (n + 1) / 2);
      return count;
  }
}