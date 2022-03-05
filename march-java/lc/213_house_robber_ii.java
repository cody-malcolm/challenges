// 0ms / 100% / 41.9MB / 16.94%

class Solution {
  private int helper(int[] nums, int start, int end) {
      if (nums.length < 3) return nums[0 + start];
      if (nums.length == 3) return Math.max(nums[0 + start], nums[1 + start]);
      if (nums.length == 4) return Math.max(nums[0 + start] + nums[2 + start], nums[1 + start]);

      int threeAgo = nums[0 + start];
      int twoAgo = nums[1 + start];
      int last = nums[2 + start] + nums[0 + start];
      int curr = 0;
      for (int i = 3 + start; i < end; i++) {
          curr = Math.max(nums[i] + twoAgo, nums[i] + threeAgo);
          curr = curr > last ? curr : last;
          threeAgo = twoAgo;
          twoAgo = last;
          last = curr;
      }

      return curr;
  }
  public int rob(int[] nums) {
      if (nums.length == 1) return nums[0];
      return Math.max(helper(nums, 0, nums.length - 1), helper(nums, 1, nums.length));
  }
}