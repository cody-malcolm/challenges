// 0ms / 100.0% / 54.3MB / 45.44%

class Solution {
  public int helper(int[] nums, int l, int r, int target) {
      if (l >= r) return nums[l] == target ? l : -1;
      
      int mid = (r - l) / 2 + l;
      return nums[mid] >= target ? helper(nums, l, mid, target) : helper(nums, mid + 1, r, target); 
  }
  
  public int search(int[] nums, int target) {
      return helper(nums, 0, nums.length - 1, target);
  }
}