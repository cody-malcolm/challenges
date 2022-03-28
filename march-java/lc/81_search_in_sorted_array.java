// 0ms / 100.0% (18.69% 0ms, 68.94% 1ms) / 41.7MB / 97.25%

class Solution {
  public boolean helper(int[] nums, int l, int r, int target) {
      if (l >= r) return nums[r] == target;

      int left = nums[l];
      int right = nums[r];
      int mid = (r - l) / 2 + l;
      if (left >= right) {
          return helper(nums, l, mid, target) || helper(nums, mid + 1, r, target);
      } else {
          return target >= left && target <= right && helper(nums, l, mid, target) || helper(nums, mid + 1, r, target);
      }
  }

  public boolean search(int[] nums, int target) {
      if (nums.length == 1) return nums[0] == target;
      int mid = nums.length / 2;
      return helper(nums, 0, mid, target) || helper(nums, mid + 1, nums.length - 1, target);
  }
}