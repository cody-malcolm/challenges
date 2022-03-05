// 0ms / 100% / 41.6MB / 27.03%

class Solution {
  public int rob(int[] nums) {
      if (nums.length < 2) return nums[0];
      if (nums.length == 2) return Math.max(nums[0], nums[1]);
      if (nums.length == 3) return Math.max(nums[0] + nums[2], nums[1]);

      int threeAgo = nums[0];
      int twoAgo = nums[1];
      int last = nums[2] + nums[0];
      int curr = 0;
      for (int i = 3; i < nums.length; i++) {
          curr = Math.max(nums[i] + twoAgo, nums[i] + threeAgo);
          curr = curr > last ? curr : last;
          threeAgo = twoAgo;
          twoAgo = last;
          last = curr;
      }

      return curr;
  }
}