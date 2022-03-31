// 0ms / 100% / 39.8MB / 89.17%

class Solution {
  private boolean isPossible(int[] nums, int target, int m) {
      int sum = 0;
      int i = -1;
      int count = 1;
      while (++i < nums.length) {
          sum += nums[i];
          if (sum > target) {
              if (++count > m) return false;
              sum = nums[i];
          }
      }
      return true;
  }
  
  public int splitArray(int[] nums, int m) {
      int min = nums[0];
      int max = 0;
      
      for (int i = 0; i < nums.length; ++i) {
          max += nums[i];
          min = min < nums[i] ? nums[i] : min;
      }
      
      if (m == nums.length) return min;
      
      int best = max;
      
      int next = (min + max) / m;
      if (next < min) next = min;
      
      if (isPossible(nums, next, m)) {
          best = next;
          max = next - 1;
      } else {
          min = next + 1;
      }
      
      while (min <= max) {
          next = (min + max) / 2;
          if (isPossible(nums, next, m)) {
              best = next;
              max = next - 1;
          } else {
              min = next + 1;
          }
      }        
      
      return best;
  }
}